import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_design/widgets/header.dart';
import 'package:flutter_finance_app_ui_design/widgets/transaction_cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = .55;
  double _opacity = .9;

  void _addTransaction() {
    setState(() {
      _height = .09;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      _height = .55;
      _opacity = .9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.short_text),
          onPressed: () {},
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Personal Finance",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        Column(
          children: [
            Header(_addTransaction),
          ],
        ),
        TransactionCart(_height, _done)
      ]),
    );
  }
}
