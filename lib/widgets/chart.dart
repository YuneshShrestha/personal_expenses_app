import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactionList;
  const Chart(this.transactionList, {Key? key}) : super(key: key);
  List<Map<String, dynamic>> get dayWiseTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmt = 0.0;
      for (var i = 0; i < transactionList.length; i++) {
        if (transactionList[i].date.day == weekDay.day &&
            transactionList[i].date.month == weekDay.month &&
            transactionList[i].date.year == weekDay.year) {
          // print('${transactionList[i].date.day} ${weekDay.day}');
          totalAmt += transactionList[i].expenses;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amt': totalAmt};
    });
  }

  double get totalSpending {
    double sum = 0.0;
    for (int i = 0; i < dayWiseTransaction.length; i++) {
      sum = sum + dayWiseTransaction[i]['amt'];
    }
    return sum;
    // return dayWiseTransaction.fold(0.0, (sum, element) {
    //   return sum + element['amt'];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: dayWiseTransaction.map((e) {
          return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(e['day'], e['amt'],
                  totalSpending == 0.0 ? 0 : e['amt'] / totalSpending));
        }).toList(),
      ),
    );
  }
}
