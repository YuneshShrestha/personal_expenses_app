import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
import './app_setting.dart';
// import 'package:intl/intl_browser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  List<Transaction> transaction = [
    Transaction(
        id: 1, title: 'Brought Book', expenses: 200.3, date: DateTime.now()),
    Transaction(
        id: 1, title: 'New Clothes', expenses: 1200.3, date: DateTime.now()),
  ];
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Expenses"),
        backgroundColor: MySetting.primary,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const SizedBox(
          width: double.infinity,
          child: Card(
            child: Center(child: Text('Graph')),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: transaction.map((tx) {
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
                          'Rs. ${tx.expenses}',
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
                          tx.title,
                          style: TextStyle(
                              color: MySetting.primarytextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          DateFormat().format(tx.date),
                          style: TextStyle(
                              color: MySetting.secondaryTextColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ));
            }).toList())
      ]),
    );
  }
}
