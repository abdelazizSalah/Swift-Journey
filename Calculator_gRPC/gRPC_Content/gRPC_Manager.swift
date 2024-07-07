//
//  gRPC_Manager.swift
//  Calculator_gRPC
//
//  Created by zizo on 04/04/2024.
//

import Foundation
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf
import Foundation

class TimerExample {
    static var timer: Timer?
    static var startTime: Date?
//
//    init() {
//        // Start the timer
////        startTimer()
//    }
//
//    deinit {
//        // Invalidate the timer when the object is deallocated
////        timer?.invalidate()
//    }

    @objc static func timerAction() {
        // Check if startTime is nil (timer has just started)
        if startTime == nil {
            // Record the start time when the timer fires for the first time
            startTime = Date()
        } else {
            // Calculate the elapsed time since the timer started firing
            if let startTime = startTime {
                let currentTime = Date()
                let elapsedTime = currentTime.timeIntervalSince(startTime)
                print("Time elapsed: \(elapsedTime) seconds")
            }
        }
    }

    static func startTimer() {
        // Create and start the timer
        timer = Timer.scheduledTimer(
            timeInterval: 1.0, // Time interval in seconds
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
        timer?.fire()
    }
}



class MyConnectivityDelegate: ConnectivityStateDelegate {
    @Published var sendBool: Bool = false
    
    
    func connectivityStateDidChange(from oldState: ConnectivityState, to newState: ConnectivityState) {
        // Handle the change in connectivity state here
        print("Connectivity state changed from \(oldState) to \(newState)")
        if newState == .ready {
            print("The channel now is ready to send data.")
            sendBool = true
            print("Send bool is now: \(sendBool)")
        }
        else if newState == .shutdown {
            sendBool = false
            
            print("Send bool is now: \(sendBool)")
        } else {
            print("the current state is : \(newState)")
        }
    }
}

 

class GRPCManager {
    static let shared = GRPCManager()
    private let delegate = MyConnectivityDelegate()
    private let client: Calc_CalcClientProtocol!
    private let channel: ClientConnection
    private init() {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let host = "localhost"
        let port = 50051
        let configuration = ClientConnection.Configuration.default(
                target: .hostAndPort(host, port),
                eventLoopGroup: group
//                tls: .init()
            )
        self.channel = ClientConnection(configuration: configuration)
        self.client = Calc_CalcNIOClient(channel: channel)
    }
    
    
// Will add grpc methods like unary, server streaming, client streaming, bidirectional streaming
}

extension GRPCManager {
    /// Unary Method
    func addTwoNumbers(num: Int, num2: Int) {
        // Perform a connection attempt without initiating an RPC call
        // Wait for the connection attempt to complete
        self.channel.connectivity.delegate = self.delegate
        print("Add Two Numbers")
//        print(client.channel)
//        guard client != nil else {return}
        
        var request = Calc_AddRequest()
        request.firstNumber = Int32(num)
        request.secondNumber = Int32(num2)
        print(request.firstNumber);
        print(request.secondNumber);
        let calloption = CallOptions(eventLoopPreference: .indifferent)
        

        // Make the RPC call to the server.
        let connectionStatus1 = self.channel.connectivity.state
        print("The connection state is: \(connectionStatus1)")

        // Once the connection is ready, create the client
        if connectionStatus1 == .ready {
//            client = Calc_CalcNIOClient(channel: channel)
            print("Is Open  1")
        } else {
            print("Error: Connection is not ready.")
//            client = nil
        }
        
        // Call the gRPC client method only when the channel's connectivity state is `.ready`
        print("dummy call")
        var unaryCall = client.add(request, callOptions: calloption)
        
       
        TimerExample.startTimer()
        while (self.delegate.sendBool != true) {
//            print("Busy wait")
        }
        TimerExample.timer?.invalidate()
        TimerExample.timerAction()
        print ("Call after being active.")
        unaryCall.response.whenComplete { result in
            switch result {
            case let .success(response):
                print("Response received: \(response)") // Print the response
            case let .failure(error):
                print("Error occurred: \(error)") // Print any errors that occurred
            }
        }
        
//        unaryCall = client.add(request, callOptions: calloption)
//        let connectionStatus2 = self.channel.connectivity.state
//        print("The connection state 2 is: \(connectionStatus2)")
//
//        // Once the connection is ready, create the client
//        if connectionStatus2 == .ready {
////            client = Calc_CalcNIOClient(channel: channel)
//            print("Is Open")
//        } else {
//            print("Error: Connection is not ready.")
////            client = nil
//        }
//        // wait() on the response to stop the program from exiting before the response is received.
//        do {
//            let response = try unaryCall.response.wait()
//            print("Sum Received received: \(response.sumResult)")
//        } catch {
//            print("Sum Received failed: \(error)")
//            return
//        }
//        let connectionStatus3 = self.channel.connectivity.state
//        print("The connection state 3 is: \(connectionStatus3)")
//
//        // Once the connection is ready, create the client
//        if connectionStatus3 == .ready {
////            client = Calc_CalcNIOClient(channel: channel)
//            print("Is Open")
//        } else {
//            print("Error: Connection is not ready.")
////            client = nil
//        }
    }
    
    /// Client Streaming
    func computeAverage() {
        
        self.channel.connectivity.delegate = self.delegate
            var request = Calc_ComputeAverageRequest()
            request.number = Int32(3)
        
        // Make the RPC call to the server.
        let connectionStatus1 = self.channel.connectivity.state
        print("The connection state is: \(connectionStatus1)")

        // Once the connection is ready, create the client
        if connectionStatus1 == .ready {
//            client = Calc_CalcNIOClient(channel: channel)
            print("Is Open  1")
        } else {
            print("Error: Connection is not ready.")
//            client = nil
        }
        
        let calloption = CallOptions(eventLoopPreference: .indifferent)
        let call = client.computeAverage(callOptions: calloption)
        
         TimerExample.startTimer()
         while (self.delegate.sendBool != true) {
//             print("Busy wait")
         }
         TimerExample.timer?.invalidate()
         TimerExample.timer = nil
         TimerExample.timerAction()
         print ("Call after being active.")
         
            let _ = call.response.always { result in
                switch result {
                case .success(let response):
                    print("Success response \(response.average)")
                case .failure(let error):
                    print("Error on response \(error)")
                }
            }
            
            print("\n [Client streaming] -->Calling the method average() on server");
            request.number = Int32(4)
            let _ = call.sendMessage(request);
            print("\n [Client streaming] --> Sending \(request.number) to server");
            
            request.number = Int32(5)
            let _ = call.sendMessage(request);
            print("\n [Client streaming] --> Sending \(request.number) to server");
            
            request.number = Int32(17)
            let _ = call.sendMessage(request);
            print("\n [Client streaming] --> Sending \(request.number) to server");
            
            let _ = call.sendEnd().always { result in
                switch result {
                case .failure(let error):
                    print("error on end call ", error)
                case .success():
                    print("success on end call")
                }
            }
            
        }
    
    /// Server Streaming
    func invokeFiboStream() {
        
        self.channel.connectivity.delegate = self.delegate
            var request = Calc_FiboRequest()
            request.num = Int64(8)
            print("\n [Server streaming] -->Calling the method fibo() on server");
            
            // Created our server client
            let myClient = client.fibo(request, callOptions: nil) { response in
                print("\n [Server streaming] fibo() ", response.num);
            }
        }
    
    /// Bidirectional streaming
    func findMax() {
        
        self.channel.connectivity.delegate = self.delegate
            var request = Calc_FindMaximumRequest()
            
            // Make the RPC call to the server.
            var currentMaxNumber = Int32(0)
            let bdCall = client.findMaximum(callOptions: nil) { res in
                if currentMaxNumber <= res.maximum {
                    currentMaxNumber = res.maximum
                    print("CurrentMax =", currentMaxNumber)
                }
            }
            let arrInt = [3, 5, 17, 30, 8, 35, 12, 129, 345, 769, 0];
            
            for i in arrInt {
                print("* BD * Sending number:", i)
                request.number = Int32(i)
                let _ = bdCall.sendMessage(request)
                sleep(1)
            }
            
            let end = bdCall.sendEnd()
            _ = end.always { res in
                switch res {
                case .success:
                    print("Ended BD: Success")
                case .failure(let error):
                    print("error \(error)")
                }
            }
            print("Eventloop BD")
        }
}
