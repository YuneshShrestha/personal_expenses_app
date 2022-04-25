import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  const NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _dateTime;
  void _callAddTransaction() {
    if (_descriptionController.text.isEmpty && _amountController.text.isEmpty) {
      return;
    }
    String descriptionText = _descriptionController.text;
    double amountText = double.parse(_amountController.text);
    if (descriptionText.isEmpty || amountText <= 0 || _dateTime == null) {
      return;
    }
    widget.addTransaction(descriptionText, amountText, _dateTime);
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
  }

  void _addDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
            firstDate: DateTime(2022))
        .then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Description'),
              controller: _descriptionController,
              // _ means we get an argument but don't care about it
              onSubmitted: (_) => _callAddTransaction(),
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Amount'),
              onSubmitted: (_) => _callAddTransaction(),
              keyboardType: TextInputType.number,
              controller: _amountController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dateTime == null
                    ? const Text('No Date Added')
                    : Text(
                        'Added Date: ${DateFormat.yMMMd().format(_dateTime!).toString()}'),
                TextButton(
                    onPressed: () {
                      _addDate();
                    },
                    child: const Text(
                      'Add Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            ElevatedButton(
              onPressed: _callAddTransaction,
              child: const Text('Save'),
            ),
          ]),
        ),
      ),
    );
  }
}
