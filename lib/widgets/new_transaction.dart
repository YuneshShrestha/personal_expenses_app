import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  void _callAddTransaction() {
    String descriptionText = descriptionController.text;
    double amountText = double.parse(amountController.text);
    if (descriptionText.isEmpty || amountText <= 0) {
      return;
    }
    addTransaction(descriptionText, amountText);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

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
