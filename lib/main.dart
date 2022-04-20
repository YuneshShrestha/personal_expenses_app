import 'package:flutter/material.dart';
import '../widgets/user_transaction.dart';
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
      theme: ThemeData(primarySwatch: MySetting.primary),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Daily Expenses"),
        // backgroundColor: MySetting.primary,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Card(
              child: Center(child: Text('Graph')),
            ),
            UserTransacion()
          ]),
    );
  }
}
