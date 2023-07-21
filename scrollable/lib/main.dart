import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mobile Team'),
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
  List _mobileTeam = [];
  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('images/team_info.json');
    final data = await json.decode(response);
    setState(() {
      _mobileTeam = data["team_info"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Mobile Team'),
        ),
        body: ListView.builder(
            itemCount: _mobileTeam.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Hero(
                    tag: _mobileTeam[index]['name'],
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    team: _mobileTeam[index],
                                  )),
                        );
                      },
                      child: Image.asset(
                        'images/people/${_mobileTeam[index]['name']}.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  Text(
                    _mobileTeam[index]['name'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ]),
              );
            }));
  }
}

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //       centerTitle: true,
  //     ),
  //     body: 
      // SingleChildScrollView(
      //   child: Column(
      //     // crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             margin: const EdgeInsets.all(10.0),
      //             // margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
      //             color: Colors.blue,
      //             width: 200,
      //             height: 200,
      //             child: Padding(
      //               padding: EdgeInsets.all(18),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => const DetailsPage(
      //                               title: '',
      //                             )),
      //                   );
      //                 },
      //                 child: const Image(
      //                   image: AssetImage('images/people/ahrar.png'),
      //                   width: 200,
      //                   height: 200,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           const Text('Ahrar'),
      //         ],
      //       ),

      //       // Padding(
      //       //   padding: EdgeInsets.all(18),
      //       //   child: Image(
      //       //     image: AssetImage('images/people/hamed.png'),
      //       //     width: 200,
      //       //     height: 200,
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: EdgeInsets.all(18),
      //       //   child: Image(
      //       //     image: AssetImage('images/people/horam.png'),
      //       //     width: 200,
      //       //     height: 200,
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: EdgeInsets.all(18),
      //       //   child: Image(
      //       //     image: AssetImage('images/people/osama.png'),
      //       //     width: 200,
      //       //     height: 200,
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: EdgeInsets.all(18),
      //       //   child: Image(
      //       //     image: AssetImage('images/people/ramin.png'),
      //       //     width: 200,
      //       //     height: 200,
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: EdgeInsets.all(18),
      //       //   child: Image(
      //       //     image: AssetImage('images/people/weng.png'),
      //       //     width: 200,
      //       //     height: 200,
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: EdgeInsets.all(18),
      //       //   child: Image(
      //       //     image: AssetImage('images/people/zohreh.png'),
      //       //     width: 200,
      //       //     height: 200,
      //       //   ),
      //       // ),

      //       // Image:asset('assets/images/people/ahrar.png'),
      //     ],
      //   ),
      // ),
//     );
//   }
// }
