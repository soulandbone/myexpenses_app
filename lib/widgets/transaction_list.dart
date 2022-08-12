import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((tx) {
        return Card(
            elevation: 5,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 3)),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(color: Colors.purple, fontSize: 24),
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
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ));
      }).toList(),
    );
  }
}
