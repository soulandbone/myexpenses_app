import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // NewTransaction({Key? key}) : super(key: key);

  final Function addNewTrx;
  NewTransaction(this.addNewTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void _submitData() {
    final savedTitle = titleInput.text;
    final savedAmount = double.parse(amountInput.text);

    if (savedTitle.isEmpty || savedAmount <= 0) {
      return;
    }

    widget.addNewTrx(savedTitle, savedAmount);
    Navigator.pop(context); //Navigator.of(context).pop
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleInput,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No date CHOSEN!'),
                  TextButton(onPressed: () {}, child: Text('Choose date'))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style:
                    TextStyle(color: Theme.of(context).textTheme.button!.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
