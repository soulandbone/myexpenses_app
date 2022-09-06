import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // ChartBar({Key? key}) : super(key: key);

  final String label;
  final double amount;
  final double pctOfTotalAmount;

  ChartBar(this.label, this.amount, this.pctOfTotalAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${amount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: pctOfTotalAmount,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
