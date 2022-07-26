import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
  //   runApp(const MyApp());
  // });
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

  var _chartOn = true;

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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((trx) => id == trx.id);
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
    final _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () => _showNewTransactionModal(context),
            icon: const Icon(Icons.add))
      ],
      title: Text(widget.title),
    );

    final deviceHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        5 -
        MediaQuery.of(context).padding.top;

    final switchWidgetRow =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Show Chart'),
      Switch(
          value: _chartOn,
          onChanged: (value) {
            setState(() {
              _chartOn = value;
            });
          })
    ]);
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTransactionModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          if (_isLandscape) switchWidgetRow,
          if (_chartOn)
            Container(
                height: _isLandscape ? deviceHeight * 0.5 : deviceHeight * 0.2,
                child: Chart(_recentTransactions)),
          SizedBox(
            height: 5,
          ),
          if (!_chartOn || !_isLandscape)
            Container(
                height: deviceHeight * 0.8,
                child: TransactionList(_userTransactions, _deleteTransaction)),
        ],
      ),
    );
  }
}
// Added a new comment to main