import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  //TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTrx;

  TransactionList(this.transactions, this.deleteTrx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "You haven't added any transactions yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].text),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () => deleteTrx(transactions[index].id),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            label: Text('Delete'))
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            onPressed: () => deleteTrx(transactions[index].id),
                          ),
                  ),
                );
              }),
    );
  }
}
