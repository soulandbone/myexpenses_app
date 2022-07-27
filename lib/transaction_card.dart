import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  double price;
  String text;
  String date;

  TransactionCard(
      {required this.price, required this.text, required this.date});

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
                  price.toString(),
                  style: TextStyle(fontSize: 26),
                )),
          ]),
          Column(
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
