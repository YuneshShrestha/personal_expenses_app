import 'package:flutter/material.dart';

import 'package:personal_expenses/widgets/transaction_item.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function delete;
  const TransactionList(this.transactionList, this.delete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: transactionList.map((tx) { return TransactionItem(tx, delete,
            key: ValueKey(tx.id));}).toList() ,
      
    );
  }
}
