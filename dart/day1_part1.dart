import 'dart:async';
import 'dart:math';

void main() {
  // doSomethingAsyncWithoutAwait();
  // doSomethingAsyncWithAwait();
  // doSomethingWithoutTryCatch();
  // doSomethingWithTryCatch();
  StreamExample streamExample = StreamExample();
  streamExample.generateRandomNumber();
  streamExample.listenToStream();
  streamExample.stopListeningTheStream();
}

// Future
// Future<return_type> function_name (argument(s)) async{
// doSomethingAsync();
// }

Future<void> doSomethingAsyncWithoutAwait() async {
  print('Start of Async function');

  Future.delayed(Duration(seconds: 2), () => print('inside async exacuation'));

  print('End of Async function');
}

Future<void> doSomethingAsyncWithAwait() async {
  print('Start of Async function');

  await Future.delayed(
      Duration(seconds: 2), () => print('inside async exacuation'));

  print('End of Async function');
}

// Try catch
// try{
//    we try to do something
// } catch(error) {
//    do something if try does not work
// }

void doSomethingWithTryCatch() {
  List<String> fruits = ['Banana', 'Melon', 'Mango'];
  try {
    print(fruits[2]);
  } catch (error) {
    print('Catch: $error');
  }
}

// [StreamController]

class StreamExample {
  StreamController _controller = StreamController();
  late StreamSubscription _streamSubscription;

  void generateRandomNumber() {
    DateTime currentTime = DateTime.now();
    DateTime endTime = currentTime.add(Duration(seconds: 15));

    // while (DateTime.now().isBefore(EndTime)) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (DateTime.now().isBefore(endTime)) {
        int randomNumber = Random().nextInt(10);
        print('The Random Number generated is : $randomNumber');
        _controller.add(randomNumber);
      } else {
        timer.cancel();
      }
    });
  }

  // create a listener
  void listenToStream() {
    _streamSubscription = _controller.stream.listen((randomNumber) {
      print('Listening to stream events : $randomNumber');
    });
  }

  Future<void> stopListeningTheStream() async {
    await Future.delayed(
        Duration(seconds: 10), () => _streamSubscription.cancel());
  }
}
