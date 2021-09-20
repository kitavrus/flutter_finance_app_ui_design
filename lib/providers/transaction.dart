import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;

  Transaction({
    this.id,
    this.title,
    this.value,
    this.category,
    this.iconData,
    this.color,
  });
}

class Transactions with ChangeNotifier {
  List<Transaction> _transaction = [
    Transaction(
      id: 1,
      title: 'Business -',
      value: 149.99,
      category: 'Business',
      iconData: Icons.fastfood,
      color: Color(0xff40bad5),
    ),
    Transaction(
      id: 2,
      title: 'Meals -',
      value: 143.99,
      category: 'Meals',
      iconData: Icons.fastfood,
      color: Color(0xff40ba5b),
    ),
    Transaction(
      id: 3,
      title: 'Gifts -',
      value: 49.99,
      category: 'Gifts',
      iconData: Icons.fastfood,
      color: Color(0xff40ba5b),
    ),
    Transaction(
      id: 4,
      title: 'Gaming -',
      value: 27.35,
      category: 'Gaming',
      iconData: Icons.fastfood,
      color: Color(0xff40ba5b),
    ),
    Transaction(
      id: 5,
      title: 'Entertainment -',
      value: 34.99,
      category: 'Entertainment',
      iconData: Icons.fastfood,
      color: Color(0xff40ba5b),
    ),
    Transaction(
      id: 6,
      title: 'MOmi',
      value: 4.99,
      category: 'Entertainment',
      iconData: Icons.fastfood,
      color: Color(0xff40ba5b),
    ),
  ];

  List<Transaction> get transactions {
    return _transaction;
  }
}
