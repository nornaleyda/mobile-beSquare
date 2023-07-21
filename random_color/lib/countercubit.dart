import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // can be passes to different screen easily.
    return BlocProvider(
      create: (BuildContext context) {
        return CounterCubit();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Cubit Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    counterCubit.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocListener<CounterCubit, int>(
              listenWhen: (int prevState, int newState) {
                return newState % 5 == 0;
              },
              listener: (BuildContext context, state) {
                // shows pop-up message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('The number is multiply of five.')),
                );
              },
              child: BlocBuilder<CounterCubit, int>(
                  builder: (BuildContext context, int counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ),
            // bloc: BlocProvider.of<CounterCubit>(context),
            // buildWhen: (preState, newState) {
            //   return newState % 2 != 0;
            // },
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    // final int currentState = state;
    // final int newState = currentState + 1;
    // emit(newState);
    // above is the longer version of the same function as the one below.
    emit(state + 1);
  }
}
