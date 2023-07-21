import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit();
      },
      child: MaterialApp(
        title: 'Weather app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherScreen(),
      ),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<WeatherCubit>(context).fetchWeather(
                      _textEditingController.text,
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                )
              ],
            ),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (
                BuildContext context,
                WeatherState state,
              ) {
                if (state is WeatherStateLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherStateLoaded) {
                  return Text(state.state);
                }
                return const Text('No weather state yet');
              },
            )
          ],
        ),
      ),
    );
  }
}

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherStateInitial());

  static const _weatherStates = <String>[
    'Sunny',
    'Cloudy',
    'Snowy',
    'Stormy',
  ];

  void fetchWeather(String location) async {
    if (location.isEmpty) {
      emit(WeatherStateInitial());
    } else {
      emit(WeatherStateLoading());

      await Future.delayed(const Duration(seconds: 1));

      final int randomIndex = Random().nextInt(_weatherStates.length);

      emit(WeatherStateLoaded(_weatherStates[randomIndex]));
    }
  }
}

abstract class WeatherState {}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  WeatherStateLoaded(this.state);

  final String state;
}