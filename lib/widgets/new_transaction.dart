import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final descriptionController = TextEditingController();

  final amountController = TextEditingController();

  void _callAddTransaction() {
    String descriptionText = descriptionController.text;
    double amountText = double.parse(amountController.text);
    if (descriptionText.isEmpty || amountText <= 0) {
      return;
    }
    widget.addTransaction(descriptionText, amountText);
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Description'),
            controller: descriptionController,
            // _ means we get an argument but don't care about it
            onSubmitted: (_) => _callAddTransaction(),
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Amount'),
            onSubmitted: (_) => _callAddTransaction(),
            keyboardType: TextInputType.number,
            controller: amountController,
          ),
          TextButton(
            onPressed: _callAddTransaction,
            child: const Text('Save'),
          ),
        ]),
      ),
    );
  }
}
