import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // NewTransaction({Key? key}) : super(key: key);

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  final Function addNewTrx;
  NewTransaction(this.addNewTrx);

  void submitData() {
    final savedTitle = titleInput.text;
    final savedAmount = double.parse(amountInput.text);

    if (savedTitle.isEmpty || savedAmount <= 0) {
      return;
    }

    addNewTrx(savedTitle, savedAmount);
  }

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
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountInput,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            onPressed: submitData,
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
