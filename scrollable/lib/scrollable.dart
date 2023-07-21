// import 'dart:async';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Scrollable Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   StreamController<String> streamController = StreamController();

//   void getData() async {
//     while (true) {
//       Future.delayed(Duration(seconds: 1));
//       streamController.add('$counter');
//       counter++;
//     }
//   }

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: StreamBuilder<String>(
//           stream: StreamConsumer.stream,
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     color: Colors.amber,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 500,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 500,
//                     height: 100,
//                   ),
//                 ],
//               ),
//             );
//           }
//         ),
//       ),
//     );
//   }
// }
