import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class TransactionManagement extends StatefulWidget {
  const TransactionManagement({Key? key}) : super(key: key);

  @override
  State<TransactionManagement> createState() => _TransactionManagementState();
}

class _TransactionManagementState extends State<TransactionManagement> {
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

  void addNewTransaction(String txTitle, double txAmount) {
    Transaction transaction = Transaction(
        text: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
