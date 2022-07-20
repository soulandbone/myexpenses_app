import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
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
                  '\$69.99',
                  style: TextStyle(fontSize: 26),
                )),
          ]),
          Column(
            children: [
              Text(
                'New Zapatos',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Jun 17, 2022',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
