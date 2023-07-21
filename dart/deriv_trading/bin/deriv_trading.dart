import 'dart:async';
import 'dart:convert';
import 'dart:io';

const String url =
    'wss://ws.binaryws.com/websockets/v3?app_id=31063&l=EN&brand=deriv';

WebSocket? socket;

Future<void> main() async {
  // Connect to websocket.
  try {
    printYellow("Connecting to Websocket");
    socket = await WebSocket.connect(url);
    printGreen("connected");
  } catch (e) {
    printYellow("not able : $e");
  }
  // Listen for messages.
  socket?.listen((messages) {
    print('Listen to message from server $messages');
    Map<String, dynamic> response = jsonDecode(messages);
    handlePing(response);
    handleInput();
  });
  // Get user command.
  handleInput();
}

void handleInput() {
  printYellow("Enter a command: ");
  String? command = stdin.readLineSync();

  switch (command) {
    case 'ping':
      sendPing(command!);
      break;
    default:
      printRed('Unknown command.');
      handleInput();
  }
}

void sendPing(String input) {
  // Send ping request.
  Map<String, dynamic> request = {input: 1};
  socket?.add(jsonEncode(request));
}

void handlePing(Map<String, dynamic> data) {
  if (data['msg_type'] == 'ping') {
    // Handle ping response.
    printGreen(data['ping']);
  }
}

class sendSymbol{
  // Send symbols request

}

class handleSymbol{
  // Handle symbol response 
}

void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m');
}

void printRed(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printYellow(String text) {
  print('\x1B[33m$text\x1B[0m');
}
