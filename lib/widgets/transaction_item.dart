import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/app_setting.dart';
import 'package:personal_expenses/model/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function delete;
  const TransactionItem(this.transaction, this.delete, {Key? key})
      : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  List<Color>? colors;
  Color? color;
  @override
  void initState() {
    print('Hello');
    super.initState();
    colors = [Colors.red, Colors.blue, Colors.purple, Colors.black];
    color = colors![Random().nextInt(colors!.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                child: Text(
                  'Rs. ${widget.transaction.expenses.toStringAsFixed(2)}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: color,
                      // fontsize
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.transaction.title,
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    DateFormat.yMMMd().format(widget.transaction.date),
                    style: TextStyle(
                        color: MySetting.secondaryTextColor,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: MediaQuery.of(context).size.width > 460
                ? TextButton.icon(
                    onPressed: () {
                      widget.delete(widget.transaction.id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    label: const Text('Delete'))
                : SizedBox(
                    width: 10.0,
                    child: IconButton(
                        onPressed: () {
                          widget.delete(widget.transaction.id);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        )),
                  ),
          ),
        ],
      ),
    ));
  }
}
