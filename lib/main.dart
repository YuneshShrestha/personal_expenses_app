import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
// import '../widgets/user_transaction.dart';
import 'model/app_setting.dart';
// import 'package:intl/intl_browser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MySetting.primary,
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          headline6: ThemeData.light()
              .textTheme
              .copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: textScaleFactor * 18,
                      fontWeight: FontWeight.bold))
              .headline6,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: textScaleFactor * 20,
                      fontWeight: FontWeight.bold))
              .headline6,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactionList = [];

  void _addTransaction(String title, double expenses, DateTime date) {
    var newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        expenses: expenses,
        date: date);
    setState(() {
      _transactionList.add(newTransaction);
    });
  }

  void _openAddExpensesBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void _delete(id) {
    setState(() {
      _transactionList.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  List<Transaction> get getNewTransaction {
    return _transactionList.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: const Text("Daily Expenses"),
      actions: [
        IconButton(
            onPressed: () => _openAddExpensesBottomSheet(context),
            icon: const Icon(Icons.add))
      ],
      // backgroundColor: MySetting.primary,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar,
      body: _transactionList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Data Entered',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset('assets/images/no_data.png')
              ],
            )
          : ListView(children: [
              SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.3) -
                      (_appBar.preferredSize.height) -
                      (MediaQuery.of(context).padding.top),
                  child: Chart(getNewTransaction)),
              SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.7) -
                      (_appBar.preferredSize.height) -
                      (MediaQuery.of(context).padding.top),
                  child: TransactionList(_transactionList, _delete)),
            ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddExpensesBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
