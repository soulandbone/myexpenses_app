import 'package:flutter/material.dart';

import './transaction_card.dart';

void main() {
  runApp(const MyApp());
}

// another comment just to see the terminal changes

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Expenses'),
    );

    //new comment
    // second new comment now checcking git diff
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return TransactionCard();
              })),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
