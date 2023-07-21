// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow,
//       ),
//       home: const MyHomePage(title: 'Flexible'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Flexible(
//             flex: 4,
//             child: Row(
//               children: [
//                 Flexible(
//                     flex: 2,
//                     child: Container(
//                       color: Colors.yellow,
//                     )),
//                 Flexible(
//                     child: Container(
//                   color: Colors.red,
//                 )),
//                 Flexible(
//                     child: Container(
//                   color: Colors.purple,
//                 ))
//               ],
//             ),
//           ),
//           Flexible(
//             flex: 2,
//             child: Row(
//               children: [
//                 Flexible(
//                     child: Container(
//                   color: Colors.orange,
//                 )),
//                 Flexible(
//                     flex: 1,
//                     child: Container(
//                       color: Colors.green,
//                     )),
//                 Flexible(
//                     flex: 1,
//                     child: Container(
//                       color: Colors.blue,
//                     ))
//               ],
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 Flexible(
//                     child: Container(
//                   color: Colors.amber,
//                 )),
//                 Flexible(
//                     child: Container(
//                   color: Colors.deepPurple,
//                 ))
//               ],
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Container(
//               color: Colors.grey,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
