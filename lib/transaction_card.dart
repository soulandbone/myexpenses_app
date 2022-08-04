import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  String id;
  double amount;
  String text;
  DateTime date;

  TransactionCard(
      {required this.amount,
      required this.text,
      required this.date,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(children: [
            Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.purple,
                  ),
                ),
                child: Text(
                  '\$${amount.toString()}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ]),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMd().format(date),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
