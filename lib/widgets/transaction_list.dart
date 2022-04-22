import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/app_setting.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function delete;
  const TransactionList(this.transactionList, this.delete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactionList.length,
      itemBuilder: (cxt, index) {
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
                      'Rs. ${transactionList[index].expenses.toStringAsFixed(2)}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
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
                      Text(transactionList[index].title,
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(transactionList[index].date),
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
                child: SizedBox(
                  width: 10.0,
                  child: IconButton(
                      onPressed: () {
                        delete(transactionList[index].id);
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
      },
    );
  }
}
