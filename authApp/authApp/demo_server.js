// now I will start implementing a server which implement the proto I have made. 
const PROTO_PATH = __dirname + '/gRPC_Content/authService.proto';
const grpc = require('@grpc/grpc-js')
const protoLoader = require('@grpc/proto-loader')

// suggested options for similarity to loading grpc.load behavior
const packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {
      keepCase: true,
      longs: String, // JavaScript doesn't support long ints
      enums: String, // JavaScript doesn't support enum types
      defaults: true,
      oneofs: true
    }
  )
  const protoDescriptor = grpc.loadPackageDefinition(packageDefinition)
  // grab the authService package from the protobuf file
  const authService = protoDescriptor.authService

  class AuthLogin {
    constructor (username, password) {
      this.username = username
      this.authToken = Math.random().toString(16).substr(2, 8)
      this.refreshExpiration()
    }
    refreshExpiration () {
      const currentTime = new Date()
      this.expires = currentTime.setDate(currentTime.getDate() + 1)
    }
  }

  class AuthServer {
    constructor () {
      this.authTokens = {}
      this.activeUsers = {}
    }

    login (username, password) {
        let loginData = {}
        if (username in this.activeUsers) {
        loginData = this.activeUsers[username]
        this.authTokens[loginData.authToken].refreshExpiration()
      } else {
        loginData = new AuthLogin(username, password)
        this.authTokens[loginData.authToken] = loginData
        this.activeUsers[username] = loginData.authToken
      }
      const currentTime = new Date()
      const oauthCredentials = {
        token: loginData.authToken,
        timeoutSeconds: Math.floor((loginData.expires - currentTime) / 1000)
      }
      return oauthCredentials
    }

    logout () {
        if (authToken in this.authTokens) {
          const loginData = this.authTokens[authToken]
          delete this.activeUsers[loginData.username]
          delete this.authTokens[authToken]
        }
        return { token: '', timeoutSeconds: 0 }
      }
    
  }

  const authServer = new AuthServer()

  const login = (call, callback) => {
    let username = call.request.username
    let password = call.request.password
    console.log(`Login for username: '${username}'`)
    const authData = authServer.login(username, password)
    callback(null, authData)
  }

  const logout = (call, callback) => {
    let authToken = call.request.token
    console.log(`Logout for token: '${authToken}'`)
    const authData = authServer.logout(authToken)
    callback(null, authData)
 }

 function getGrpcServer () {
    const grpcServer = new grpc.Server()
    grpcServer.addService(authService.AuthServiceRoutes.service, {
      login: login,
      logout: logout
    })
    return grpcServer
  }

const grpcServer = getGrpcServer()
console.log('Starting gRPC server on port 0.0.0.0:50051...')
grpcServer.bindAsync(
 '0.0.0.0:50051',
  grpc.ServerCredentials.createInsecure(), () => {
    grpcServer.start()
  }
)