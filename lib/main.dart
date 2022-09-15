import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontFamily: 'OpenSans', fontSize: 20)),
        textTheme: const TextTheme(
            headline6: TextStyle(
                fontFamily: 'Quicksand', fontSize: 18, color: Colors.black),
            headline1: TextStyle(
                fontFamily: 'Quicksand', fontSize: 14, color: Colors.white),
            button: TextStyle(color: Colors.white)),
      ),
      home: const MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "abc1",
      amount: 67.75,
      text: "Shoes",
      date: DateTime.now(),
    ),
    Transaction(
      id: 'abc2',
      amount: 52.55,
      text: "Clothing",
      date: DateTime.now(),
    ),
    Transaction(
        id: 'abc3', amount: 81.99, text: 'PS5 controller', date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    Transaction transaction = Transaction(
        text: txTitle,
        amount: txAmount,
        date: txDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _showNewTransactionModal(BuildContext cntxt) {
    showModalBottomSheet(
        context: cntxt,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _showNewTransactionModal(context),
              icon: const Icon(Icons.add))
        ],
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTransactionModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Chart(_recentTransactions),
          SizedBox(
            height: 5,
          ),
          TransactionList(_userTransactions),
        ],
      ),
    );
  }
}
// Added a new comment to main