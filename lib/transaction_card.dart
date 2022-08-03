import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  String id;
  double amount;
  String text;
  String date;

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
                  border: Border.all(width: 3, color: Colors.purple),
                ),
                child: Text(
                  amount.toString(),
                  style: TextStyle(fontSize: 26),
                )),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                date,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
