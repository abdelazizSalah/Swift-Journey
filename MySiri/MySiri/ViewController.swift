//
//  ViewController.swift
//  MySiri
//
//  Created by zizo on 13/05/2024.
//

import UIKit
import InstantSearchVoiceOverlay
//import AVKit
import AVFoundation

class ViewController: UIViewController, VoiceOverlayDelegate {
   
//    
//    
//    /// try to make an empty project, and check if this would work alone., yemkn el mushkela 34an badmeg ben el speech recognition speech to text, w el text to speech.
//    /// this is for converting text to speech
//    let synthesizer = AVSpeechSynthesizer ()
//    
//    
//    func speakNowTapped(spokenText:String) {
//        
//        print("speak now has been called")
//        let utterance = AVSpeechUtterance(string: "I want this to work")
//        
//        
//        utterance.rate = 0.5
//        utterance.volume = 0.1
//        /// this define the langauge inwhich we want the voice to be in.
//        utterance.voice = AVSpeechSynthesisVoice(language: "en-UK")
//        synthesizer.speak(utterance)
//    }
    
//    
    
    /// this is for converting speech to text
    let voiceOverlay = VoiceOverlayController()
    
    @IBOutlet var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myButton.backgroundColor = .systemRed
        myButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTapButton()  {
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = true
        voiceOverlay.settings.autoStopTimeout = 1
        
        voiceOverlay.start(on: self, textHandler: { text, final, _ in
            if final {
                print("Final Text is \(text)")
//                self.speakNowTapped(spokenText: text)
            } else {
//                print("In progress: \(text)")
            }
            
        }, errorHandler: { error in
            
            
        })
    }

    func recording(text: String?, final: Bool?, error: Error?) {
        
    }

}

