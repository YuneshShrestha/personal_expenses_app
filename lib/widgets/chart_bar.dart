import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentSpendingAmount;
  const ChartBar(this.label, this.spendingAmount, this.percentSpendingAmount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
            child: FittedBox(
              child: Text('Rs.$spendingAmount'),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 15.0,
            height: 75.0,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                FractionallySizedBox(
                    heightFactor: percentSpendingAmount,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15.0)),
                    )),
              ],
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}
