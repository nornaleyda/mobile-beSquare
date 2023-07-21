import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isNight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isNight ? Colors.blueGrey : Colors.deepOrange,
        title: Text(_isNight ? "Good Night" : "Good Morning"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Todo: add 2 row of data in column
            // first one has one icon and 'day' text
            // next row has one icon and 'night' text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _isNight ? false : true,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://img.freepik.com/premium-vector/cute-happy-funny-sun-with-coffee-mug-cartoon-character-illustration-icon-design-isolated-white-background-good-morning-card_92289-1317.jpg?w=2000",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: 350,
                    height: 350,
                  ),
                ),
                Visibility(
                  visible: _isNight ? true : false,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://img.freepik.com/premium-vector/cute-happy-moon-pillow-good-night-sleep-tight-card-isolated-white-background-cartoon-character-hand-drawn-style-illustration_92289-1546.jpg?w=2000",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: 350,
                    height: 350,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.wb_sunny, color: Colors.yellow)),
                Text('Day')
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.nightlight_round, color: Colors.black)),
              Text('Night')
            ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isNight ? Icons.wb_sunny : Icons.nightlight_round),
        onPressed: () {
          setState(() {
            _isNight = !_isNight;
          });
        },
      ),
    );
  }
}
