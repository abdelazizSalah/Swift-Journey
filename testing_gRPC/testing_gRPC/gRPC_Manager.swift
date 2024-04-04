//
//  gRPC_Manager.swift
//  testing_gRPC
//
//  Created by zizo on 02/04/2024.
//

import Foundation
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf

class GRPCManager {
    
    private let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
    static let shared = GRPCManager() /// creating object of the manager.
    private let client: Calc_CalcClientProtocol!
    private init() {
        let channel = ClientConnection(configuration: .default(target: ConnectionTarget.hostAndPort("127.0.0.1", 50051), eventLoopGroup: group))
        client = Calc_CalcNIOClient(channel: channel)
    }
// Will add grpc methods like unary, server streaming, client streaming, bidirectional streaming
    
    /// Unary method.
    func addTwoNumbers(num: Int, num2: Int) {
        var request = Calc_AddRequest()
        request.firstNumber = Int32(num)
        request.secondNumber = Int32(num2)
        let calloption = CallOptions(eventLoopPreference: .indifferent)
        // Make the RPC call to the server.
        let unaryCall = client.add(request, callOptions: calloption)
        // wait() on the response to stop the program from exiting before the response is received.
        do {
            let response = try unaryCall.response.wait()
            print("Sum Received received: \(response.sumResult)")
        } catch {
            print("Sum Received failed: \(error)")
            return
        }
    }
    
    
    /// Client Streaming method
    func computeAverage() {
            var request = Calc_ComputeAverageRequest()
            request.number = Int32(3)
            let call = client.computeAverage(callOptions: nil)
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
    
    /// Server streaming function
    func invokeFiboStream() {
            var request = Calc_FiboRequest()
            request.num = Int64(8)
            print("\n [Server streaming] -->Calling the method fibo() on server");
            
            // Created our server client
            let myClient = client.fibo(request, callOptions: nil) { response in
                print("\n [Server streaming] fibo() ", response.num);
            }
        }
    
    /// Bidirectional streaming function
    func findMax() {
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
