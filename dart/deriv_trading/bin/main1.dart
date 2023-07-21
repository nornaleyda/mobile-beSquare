import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'dart:io';

const String url =
    'wss://ws.binaryws.com/websockets/v3?app_id=31063&l=EN&brand=deriv';

WebSocket? socket;

Future<void> main() async {
  // Connect to websocket.
  printYellow("Websocket is connecting....");
  socket = await WebSocket.connect(url);
  printGreen("Websocket is connected....");
  handleInput();

  // Listen for messages.
  socket?.listen((dynamic e) {
    final Map<String, dynamic> data = jsonDecode(e);
    handlePing(data);
    handleActiveSymbol(data);
    handleInput();
  });
}

// Get user command.

void handleInput() {
  printYellow("Enter command");
  String? message = stdin.readLineSync();

  switch (message) {
    case 'ping':
      sendPing();
      break;
    case 'symbols':
      sendActiveSymbol();
      break;

    default:
      printRed('Enter correct command');
      handleInput();
  }
}

// void handleMessage(String message) {
//   final Map<String, dynamic> data = jsonDecode(message);
//   handlePing(data);
// }

void sendPing() {
  final Map<String, dynamic> pingMessage = {"ping": 1, "req_id": 1};
  final jsonString = jsonEncode(pingMessage);
  socket!.add(jsonString);
}

void handlePing(Map<String, dynamic> data) {
  if (data['msg_type'] == 'ping') {
    // Handle ping response.
    print('${data['ping']}');
  }
}

void activeSymbols() {
  final Map<String, dynamic> pingMessage = {
    "active_symbols": "brief",
    "product_type": "basic"
  };
  final jsonString = jsonEncode(pingMessage);
  socket!.add(jsonString);
}

// Phase 2

class ActiveSymbolRequest {
  ActiveSymbolRequest({required this.activeSymbols, required this.productType});

  final String activeSymbols;
  final String productType;

  String? toJson() {
    final Map<String, String> dict = {
      'active_symbols': activeSymbols,
      'product_type': productType,
    };
    return jsonEncode(dict);
  }
}

class ActiveSymbolResponse {
  ActiveSymbolResponse(
      {required this.market, required this.symbol, required this.displayName});

  final String market;
  final String symbol;
  final String displayName;

  static ActiveSymbolResponse fromJson(Map<String, dynamic> response) {
    return ActiveSymbolResponse(
      market: response['market'],
      symbol: response['symbol'],
      displayName: response['display_name'],
    );
  }

  @override
  String toString() {
    return displayName + ", " + market + ", " + symbol;
  }
}

void sendActiveSymbol() {
  final ActiveSymbolRequest request =
      ActiveSymbolRequest(activeSymbols: "brief", productType: "basic");
  socket!.add(request.toJson());
}

void handleActiveSymbol(Map<String, dynamic> jsonResponse) {
  if (jsonResponse['msg_type'] != 'active_symbols') {
    return;
  }
  (jsonResponse["active_symbols"] as List).forEach((element) {
    final ActiveSymbolResponse symbol = ActiveSymbolResponse.fromJson(element);
    printGreen(symbol.toString());
  });
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


///symbol, market, display name