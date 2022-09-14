import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // NewTransaction({Key? key}) : super(key: key);

  final Function addNewTrx;
  NewTransaction(this.addNewTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();
  var _selectedDate = DateTime.now();

  void _submitData() {
    final savedTitle = _titleInput.text;
    final savedAmount = double.parse(_amountInput.text);

    if (savedTitle.isEmpty || savedAmount <= 0) {
      return;
    }

    widget.addNewTrx(savedTitle, savedAmount);
    Navigator.pop(context); //Navigator.of(context).pop
  }

  void _revealDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate!;
      });
    });
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
              controller: _titleInput,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(DateFormat.yMMMd().format(_selectedDate)),
                  TextButton(
                      onPressed: _revealDatePicker, child: Text('Choose date'))
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
