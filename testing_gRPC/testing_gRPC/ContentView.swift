//import SwiftUI
//import CoreData
//struct ContentView: View {
//  @Environment(\.managedObjectContext) private var viewContext
//  // placeholders for TextFields
//  public let usernamePlaceholder: String = "Username"
//  public let passwordPlaceholder: String = "Password"
//  // data stores for TextFields (with default values set)
//  @State var username = "email@example.com"
//  @State var password = "password"
//  // initialize our gRPC AuthService client
//  let grpcAuthClient = AuthClient()
//  // data store for our login Auth token
//  @State var oauthToken = "(none)"
//  @State var isLoggedIn = false
//  var body: some View {
//    VStack {
//      TextField(usernamePlaceholder, text: $username)
//      TextField(passwordPlaceholder, text: $password)
//      Button(action: {
//        doLogin()
//      }) {
//        Text("Login")
//      }
//      Button(action: {
//        doLogout()
//      }) {
//        Text("Logout")
//      }
//      Text("Oauth Token: \(oauthToken)")
//    }
//  }
//  private func doLogin() {
//    // execute the login() method in our gRPC client
//    self.oauthToken = self.grpcAuthClient.login(
//      username: self.username,
//      password: self.password
//    )
//    self.isLoggedIn = self.oauthToken.count > 0
//  }
//  private func doLogout() {
//    // execute the logout() method in our gRPC client
//    self.grpcAuthClient.logout(oauthToken: self.oauthToken)
//    self.isLoggedIn = false
//    self.oauthToken = ""
//  }
//}
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//  }
//}
