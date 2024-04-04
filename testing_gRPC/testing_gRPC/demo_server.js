const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
const path = require('path');

// Load the proto file
const protoPath = path.resolve(__dirname, 'calc.proto');
const packageDefinition = protoLoader.loadSync(protoPath);
const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);

// Extract the service definition from the loaded proto file
const calcService = protoDescriptor.calc.Calc.service;

// Implement the gRPC service methods
const calcServer = {
  /// Khaly balak mn el naming convention, lw 5letha snack_case, w swift araha camelCase, haydrb m3ak error :()
  Add: function (call, callback) {
    // const { first_number, second_number } = call.request;
    console.log(call.request);
    let first_number = call.request.firstNumber 
    let second_number = call.request.secondNumber 
    const sumResult = first_number + second_number;
    console.log(first_number);
    console.log(second_number);
    console.log(sumResult); 
    callback(null, { sumResult });
  },
  Fibo: function (call) {
    const num = call.request.num;
    let a = 0, b = 1;
    
    // Send each Fibonacci number in the sequence back to the client
    for (let i = 0; i < num; i++) {
      const nextNumber = a;
      a = b;
      b = nextNumber + b;
      call.write({ num: nextNumber }); // Send the next Fibonacci number to the client
    }
    
    call.end(); // End the stream when all numbers have been sent
  },
  ComputeAverage: function (call, callback) {
    let sum = 0;
    let count = 0;
    
    // Handle each integer received in the stream
    call.on('data', function (request) {
      sum += request.number; // Add the number to the sum
      count++; // Increment the count
    });

    // When the stream ends, calculate the average and send it back to the client
    call.on('end', function () {
      if (count === 0) {
        callback(new Error('No numbers provided')); // Error if no numbers were provided
      } else {
        const average = sum / count; // Calculate the average
        callback(null, { average }); // Send the average back to the client
      }
    });
  },
  FindMaximum: function (call) {
    let maxNumber = Number.MIN_SAFE_INTEGER;

    // Handle each number received in the stream from the client
    call.on('data', function (request) {
      const number = request.number;
      if (number > maxNumber) {
        maxNumber = number; // Update the maximum number if a greater number is received
        call.write({ maximum: maxNumber }); // Stream back the new maximum number to the client
      }
    });

    // When the client finishes sending numbers, end the stream
    call.on('end', function () {
      call.end(); // End the stream
    });
  }
};

// Create a gRPC server
const server = new grpc.Server();

// Add the service implementation to the server
server.addService(calcService, calcServer);

// Bind the server to the specified address and port
server.bindAsync('0.0.0.0:50051', grpc.ServerCredentials.createInsecure(), (err, port) => {
  if (err) {
    console.error('Server bind failed:', err);
  } else {
    console.log(`Server running on port ${port}`);
    // Start the server
    server.start();
  }
});
