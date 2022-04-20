import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import '../model/transaction.dart';

class UserTransacion extends StatefulWidget {
  const UserTransacion({Key? key}) : super(key: key);

  @override
  State<UserTransacion> createState() => _UserTransacionState();
}

class _UserTransacionState extends State<UserTransacion> {
  final List<Transaction> _transactionList = [
    Transaction(
        id: '1', title: 'Brought Book', expenses: 200.3, date: DateTime.now()),
    Transaction(
        id: '2', title: 'New Clothes', expenses: 1200.3, date: DateTime.now()),
  ];
  void _addTransaction(String title, double expenses) {
    var newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        expenses: expenses,
        date: DateTime.now());
    setState(() {
      _transactionList.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction((String title, double expenses) {
          return _addTransaction(title, expenses);
        }),
        TransactionList(_transactionList)
      ],
    );
  }
}
