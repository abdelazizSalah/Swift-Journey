//
//  CameraViewModel.swift
//  firstApp
//
//  Created by zizo on 07/07/2024.
//

import Foundation
import AVFoundation
import UIKit
import SwiftUI

@Observable
class CameraViewModel: NSObject {
    enum PhotoCaptureState {
        case notStarted
        case processing
        case finished(Data)
    }
    
    private(set) var photoCaputreState:PhotoCaptureState = .notStarted
    
    var photoData: Data? {
        if case .finished(let data) = photoCaputreState {
            return data
        }
        return nil
    }
    
    var hasPhoto : Bool  { photoData != nil }
    
    var session = AVCaptureSession ()
    var preview = AVCaptureVideoPreviewLayer ()
    var output = AVCapturePhotoOutput()
    
    
    func requestAccessAndSetup () {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { didAllowed in
                    self.setup ()
                }
            case .authorized:
                self.setup()
            default:
                print("other status")
        }
    }
    
    private func setup () {
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        do {
            guard let device = AVCaptureDevice.default(for: .video) else { print (" can not get device"); return }
            let input = try AVCaptureDeviceInput(device: device)
            
            guard session.canAddInput(input) else { print("can not add input"); return }
            session.addInput(input)
            
             
            guard session.canAddOutput(output) else { print("can not add output"); return }
            session.addOutput(output)
            
            session.commitConfiguration()
            Task(priority: .background) {
                self.session.startRunning()
                guard let connection = self.preview.connection else {print("no connection"); return }
                self.preview.connection?.videoRotationAngle = await UIDevice.current.orientation.videoRotationAngle
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func takePhoto () {
        guard case .notStarted = photoCaputreState else {
            print("the session is already running")
            return
        }

        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        withAnimation {
            self.photoCaputreState = .processing
        }
    }
    
    func retakePhoto () {
        Task(priority: .background) {
            self.session.startRunning()
            await MainActor.run {
                self.photoCaputreState = .notStarted
            }
        }
    }
}

extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    func photoOutput (_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error { print(error.localizedDescription)}
        
        guard let imageData = photo.fileDataRepresentation() else {print("no data");  return }
        
        guard let provider = CGDataProvider(data:imageData as CFData) else { print("Can not generate cgData");  return }
        guard let cgImage = CGImage(jpegDataProviderSource: provider, decode: nil, shouldInterpolate: true, intent: .defaultIntent) else {print("no cgImage"); return}
        Task(priority: .background) {
            self.session.stopRunning()
            await MainActor.run {
                
                let image = UIImage (cgImage: cgImage, scale: 1, orientation: UIDevice.current.orientation.uiImageOrientation)
                guard let pngData = image.pngData() else {print ("can not generate png data"); return }
                withAnimation {
                    self.photoCaputreState = .finished(pngData)
                }
            }
        }
    }
}
