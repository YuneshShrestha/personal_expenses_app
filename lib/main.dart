import 'package:flutter/material.dart';
import 'package:personal_expenses/model/transaction.dart';
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
                  headline6: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold))
              .headline6,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                  headline6: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20.0,
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

  void _openAddExpensesBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Daily Expenses"),
        actions: [
          IconButton(
              onPressed: () => _openAddExpensesBottomSheet(context),
              icon: const Icon(Icons.add))
        ],
        // backgroundColor: MySetting.primary,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Card(
          child: Center(child: Text('Graph')),
        ),
        _transactionList.isEmpty
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
            : TransactionList(_transactionList)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddExpensesBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
