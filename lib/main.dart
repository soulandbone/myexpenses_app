import 'package:flutter/material.dart';

import '/models/transaction.dart';

void main() {
  runApp(const MyApp());
}

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
  }
}

List<Transaction> transactions = [
  Transaction(
    id: "abc1",
    amount: 67.75,
    text: "Shoes",
    date: DateTime.now(),
  ),
  Transaction(
    id: 'abc2',
    amount: 52.55,
    text: "Skincare",
    date: DateTime.now(),
  ),
  Transaction(
      id: 'abc3', amount: 81.99, text: 'PS5 controller', date: DateTime.now())
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: transactions.map((tx) {
            return Card(
                elevation: 5,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 3)),
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.text,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            tx.date.toString(),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          }).toList(),
        ));
  }
}
