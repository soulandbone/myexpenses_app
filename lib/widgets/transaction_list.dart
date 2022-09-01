import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  //TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 3)),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].text,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          }),
    );
  }
}
