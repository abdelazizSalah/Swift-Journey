////
////  AuthClient.swift
////  testing_gRPC
////
////  Created by zizo on 04/04/2024.
////
//
//import Foundation
//import GRPC
//import NIO
//class AuthClient {
//  var authServiceClient: AuthService_AuthServiceRoutesClient?
//  let port: Int = 50051
//  init() {
//    // build a fountain of EventLoops
//    let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
//    do {
//      // open a channel to the gPRC server
//      let channel = try GRPCChannelPool.with(
//        target: .host(“localhost”, port: self.port),
//        transportSecurity: .plaintext,
//        eventLoopGroup: eventLoopGroup
//      )
//      // create a Client
//      self.authServiceClient = AuthService_AuthServiceRoutesClient(channel: channel)
//      print(“grpc connection initialized”)
//    } catch {
//      print(“Couldn’t connect to gRPC server”)
//    }
//  }
//  /**
//   * Unary call example. Calls `login` and prints the response.
//   * This method calls the authService.AuthServiceRoutes.login()
//   * method and tries to understand the response.
//   *
//   * It sends a `AuthService_AccountCredentials` object, found in
//   * authervice.pb.swift through the gRPC method and receives a
//   * `AuthService_OauthCredentials` object back,
//   * which it attempts to parse.
//   */
//  func login(username: String, password: String) -> String {
//    print(“Login: username=\(username)”)
//    // build the AccountCredentials object
//    let accountCredentials: AuthService_AccountCredentials = .with {
//      $0.username = username
//      $0.password = password
//    }
//    // grab the login() method from the gRPC client
//    let call = self.authServiceClient!.login(accountCredentials)
//    // prepare an empty response object
//    let oauthCredentials: AuthService_OauthCredentials
//    // execute the gRPC call and grab the result
//    do {
//      oauthCredentials = try call.response.wait()
//    } catch {
//      print(“RPC method ‘login’ failed: \(error)”)
//      // it would be better to throw an error here, but
//      // let’s keep this simple for demo purposes
//      return “”
//    }
//    // Do something interesting with the result
//    let oauthToken = oauthCredentials.token
//    print(“Logged in with oauth token ‘\(oauthToken)’”)
//    // return a value so we can use it in the app
//    return oauthToken
//  }
//  func logout(oauthToken: String) {
//    print(“Logout: token=\(oauthToken)”)
//    // build the OauthCredentials object
//    let oauthCredentials: AuthService_OauthCredentials = .with {
//      $0.token = oauthToken
//    }
//    // grab the logout() method from the gRPC client
//    let call = self.authServiceClient!.logout(oauthCredentials)
//    // execute the gRPC call and grab the result
//    do {
//      _ = try call.response.wait()
//      print(“Logged out”)
//    } catch {
//      print(“RPC method ‘logout’ failed: \(error)”)
//      // it would be better to throw an error here, but
//      // let’s keep this simple for demo purposes
//      return
//    }
//  }
//}
