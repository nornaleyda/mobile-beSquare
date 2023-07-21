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
//       home: const MyHomePage(title: 'My Layout'),
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
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Text(
//                         'Welcome to My layout',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 30),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       FlutterLogo(size: 70),
//                       SizedBox(width: 16),
//                       FlutterLogo(size: 70),
//                       SizedBox(width: 16),
//                       FlutterLogo(size: 70),
//                       SizedBox(width: 16),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     children: const [
//                       Flexible(
//                           child: Text(
//                         'This is a simple example of how to use Flutter widget to build layouts. With the help of the Row and Column widgets, we can easily arrange widgets horizontally and vertically. the stack widget is useful for overlaying widgets on top of each other. And with the container widget we can easily add padding and other styling to our layout.',
//                       ))
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: const [
//                       Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                         size: 35.0,
//                         semanticLabel:
//                             'Text to announce in accessibility modes',
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                         size: 40.0,
//                       ),
//                       Icon(
//                         Icons.thumb_up,
//                         color: Colors.blue,
//                         size: 36.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: const [
//                     Text(
//                       'Created by me',
//                       textAlign: TextAlign.right,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
