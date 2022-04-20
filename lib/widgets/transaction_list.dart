import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/app_setting.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  const TransactionList(this.transactionList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.0,
      child: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (cxt, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Rs. ${transactionList[index].expenses.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: MySetting.primary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      transactionList[index].title,
                      style: TextStyle(
                          color: MySetting.primarytextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      DateFormat().format(transactionList[index].date),
                      style: TextStyle(
                          color: MySetting.secondaryTextColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
