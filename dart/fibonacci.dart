import 'dart:async';

void main() {
  StreamExample streamExample = StreamExample();
  streamExample.generateFibonacciNumber();
  streamExample.listenToStream();
  streamExample.stopListeningTheStream();
}

class StreamExample {
  StreamController _controller = StreamController();
  late StreamSubscription _streamSubscription;

  void generateFibonacciNumber() {
    var n = 1;
    int first = 0;
    _controller.add(first);

    Timer.periodic(Duration(seconds: 1), (timer) {
      int fibonacci(int n) => n <= 2 ? 1 : fibonacci(n - 2) + fibonacci(n - 1);

      String numberFibonacci = fibonacci(n).toString();
      n++;
      print('The Fibonacci generated is : $numberFibonacci');
      _controller.add(numberFibonacci);
      if (n > 10) {
        timer.cancel();
      }
    });
  }

  void listenToStream() {
    _streamSubscription = _controller.stream.listen((numberfibonacci) {
      print('Listening to stream events : $numberfibonacci');
    });
  }

  Future<void> stopListeningTheStream() async {
    await Future.delayed(
        Duration(seconds: 5), () => _streamSubscription.cancel());
  }
}
