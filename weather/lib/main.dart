import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
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
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherPage(),
      ),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

final TextEditingController _textEditingController = TextEditingController();

class _WeatherPageState extends State<WeatherPage> {
  String _weatherCondition = '';
  String _temperature = '';
  String _location = '';
  String _backgroundImageUrl = '';
  String _temperatureUnit = 'Celsius';
  bool _isLoading = false;

  String _getBackgroundImageUrl(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clear':
        return 'https://images.pexels.com/photos/998660/pexels-photo-998660.jpeg';
      case 'Clouds':
        return 'https://images.pexels.com/photos/2114014/pexels-photo-2114014.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
      case 'Rain':
      case 'Drizzle':
        return 'https://images.pexels.com/photos/7002973/pexels-photo-7002973.jpeg';
      case 'Thunderstorm':
        return 'https://images.pexels.com/photos/680940/pexels-photo-680940.jpeg';
      case 'Snow':
        return 'https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
      case 'Mist':
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Fog':
        return 'https://images.pexels.com/photos/1743392/pexels-photo-1743392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
      default:
        return 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJhY2tncm91bmR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80';
    }
  }

  void _toggleTemperatureUnit() {
    setState(() {
      if (_temperatureUnit == 'Celsius') {
        _temperatureUnit = 'Fahrenheit';
        _temperature =
            (((double.parse(_temperature) * 9 / 5) + 32).toStringAsFixed(0));
      } else {
        _temperatureUnit = 'Celsius';
        _temperature =
            (((double.parse(_temperature) - 32) * 5 / 9).toStringAsFixed(0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherStateLoaded) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_backgroundImageUrl),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  _location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  state.state,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '$_temperature° $_temperatureUnit',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _toggleTemperatureUnit,
                  child: const Text('Toggle Temperature Unit'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<WeatherCubit>(context)
                              ._getCurrentWeatherData(
                            _textEditingController.text,
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                        ),
                      )
                    ],
                  ),
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
                ),
              ],
            ),
          );
        } else {
          return const Text("Error");
        }
      }),
    );
  }
}

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherStateInitial());

  void _getCurrentWeatherData(String location) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location()&appid=ad34a8fa990b40bba5333c0faf42d0a6'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final weather = data['weather'][0];
        final main = data['main'];
        final temp = main['temp'];
        final tempInCelsius = temp - 273.15;

        emit(WeatherStateLoaded(weather, data, main, temp));
      } else {
        // throw Exception('Failed to load weather data');
        print('Data is not found');
      }
    } catch (e) {
      print('Cannot received api');
    }
  }
}

abstract class WeatherState {}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  WeatherStateLoaded(this.state, this.data, this.main, this.temp);

  final String state;
  final String data;
  final String main;
  final int temp;
}
