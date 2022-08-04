import 'package:flutter/material.dart';

import './transaction_card.dart';
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
        children: [
          Container(
            child: Card(
              child: Text('CHART'),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionCard(
                      id: transactions[index].id,
                      amount: transactions[index].amount,
                      text: transactions[index].text,
                      date: transactions[index].date,
                    );
                  }))
        ],
      ),
    );
  }
}
// Added a new comment to main