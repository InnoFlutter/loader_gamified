import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:loader_gamified/loader_gamified.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> getData() {
  return ["Hello!", "Here is", "Your", "Data.", "Have a good", "day!"];
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.lime,
          secondary: Colors.blueGrey,
          primary: Colors.green,
        )
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Gamified loader example'),
          ),
          body: FutureBuilder<List<String>>(
            future: Future.delayed(const Duration(seconds: 15), getData),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: snapshot.data!.map((elem_str) =>
                    ListTile(leading: Icon(Icons.star), title: Text(elem_str),)).toList());
              }
              // Example use of the gamified loader
              // It will show CircularProgressIndicator for 5 seconds
              // And then switch to the Shulte table
              return Center(
                child: GamifiedLoader(
                  loader: CircularProgressIndicator(),
                  loaderTimeMs: 5000,
                ),
              );
            },
          )


      ),
    );
  }
}
