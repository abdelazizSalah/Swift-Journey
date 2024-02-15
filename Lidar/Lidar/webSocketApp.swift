//
//  webSocketApp.swift
//  Lidar
//
//  Created by zizo on 15/02/2024.
//

import SwiftUI

struct webSocketApp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class ViewController: UIViewController, URLSessionWebSocketDelegate {
    private var webSocket: URLSessionWebSocketTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        let session = URLSession (
            configuration: .default,
            delegate: self,
            delegateQueue: OperationQueue()
        )
        
        let url = URL (
            string: "wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self")
        
        webSocket = session.webSocketTask(with: url!)
        
        webSocket?.resume()
    }
    
    func ping() {
        webSocket?.sendPing { error in
            if let error = error {
                print ("Ping error: \(error)")
            }
        }
    }
    
    func recieve () {
        webSocket?.receive(completionHandler: { [weak self] result in
            switch result {
            case .success( let message ) :
                switch message {
                case .data(let data) :
                    print ("Got data: \(data)")
                case .string(let message) :
                    print ("Got String: \(message)")
                @unknown default:
                    break
                }
                
            case .failure( let error):
                print("Recieve error: \(error)")
            }
            
            self?.recieve()
        })
    }
    
    func send () {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.send()
            self.webSocket?
                .send(
                    .string("Send new message: \(Int.random(in: 0...1000))"),
                    completionHandler: {
                        error in
                        if let error = error {
                            print( "Send error: \(error)")
                    }
            })
        }
    }
    
    func close ( ) {
        webSocket?.cancel(with: .goingAway, reason: "Demo endded".data(using: .utf8))
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
    func urlSession(
        _
        session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didOpenWithProtocol protocol: String?
    ) {
        print("Did connect to socket")
        ping()
        recieve()
        send()
    }
    
}

#Preview {
    webSocketApp()
}
