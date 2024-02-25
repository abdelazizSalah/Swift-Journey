//
//  ViewController.swift
//  webSockets
//
//  Created by zizo on 15/02/2024.
//

import UIKit

class ViewController: UIViewController, URLSessionWebSocketDelegate {
    
    private var webSocket: URLSessionWebSocketTask?
    private var counter:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        let session = URLSession (
            configuration: .default,
            delegate: self,
            delegateQueue: OperationQueue()
        )
        
        let websocketURL = "wss://echo.websocket.org"
        if let url = URL (
            string: websocketURL)
        {
            webSocket = session.webSocketTask(with: url)
            
            /// this starts the websocket connection.
            webSocket?.resume()
        }
    }
    
    func ping() {
        print("Ping is done")
        webSocket?.sendPing { error in
            if let error = error {
                print ("Ping error: \(error)")
            }
        }
    }
    
    func recieve () {
        
            print("Recieve is done")
        webSocket?.receive(completionHandler: {[weak self] result in
            switch result {
                case .success( let message ) :
                    switch message {
                        case .data(let data) :
                            print ("Got data: \(data)")
                        case .string(let message) :
                            print ("Got String: \(message)")
                        @unknown default:
                            print("default")
                            break
                }
                
                case .failure( let error):
                    print("Recieve error: \(error)")
            }
            
            self?.recieve()
        })
    }
    
    func send () {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { /// this allow us to wait, or determine the rate by which we send the frames to the backend.
            
            let imageName = "imageTrial"
            let uiImage = UIImage(named: imageName)
            if let imageBinary = uiImage?.jpegData(compressionQuality: 0.5) {
                /// no need to conver the image into string, we can just send the data recieved from the .jpegData :)
//                let hexString = imageBinary.map{ String(format: "%02x", $0)}.joined()
//                var data = Data(capacity: hexString.count / 2)
                self.webSocket?
                    .send(
//                        .string("image binary is : \(hexString)"), -> strings.
                        .data(imageBinary), /// -> Data.
                        
                        completionHandler: {  error in
                            if let error = error {
                                print( "Send error: \(error)")
                            } else {
                                self.send()
                                
                                    print("send is done")
                            }
                        })
                
            }
        }
    }
    
    func close ( ) {
        webSocket?.cancel(with: .goingAway, reason: "Demo endded".data(using: .utf8))
    }
    
    
    func urlSession(
        _
        session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didOpenWithProtocol protocol: String?
    ) {
        
            
        if counter >= 5 {
            close()
        } else {
            print("URL Session is done")
        print("Did connect to socket")
        counter += 1
        ping()
        send()
        
        recieve()
//        close()
        print("All are done")
        
        }
    }
    
    func urlSession(
        _
        session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
        reason: Data?
    ) {
        print("Did close connection with reason")
    }
    
}

