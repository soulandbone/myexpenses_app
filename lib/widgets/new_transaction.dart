import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // NewTransaction({Key? key}) : super(key: key);

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  final Function addNewTrx;

  NewTransaction(this.addNewTrx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleInput,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountInput,
          ),
          TextButton(
            onPressed: () {
              addNewTrx(titleInput.text, double.parse(amountInput.text));
            },
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
