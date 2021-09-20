import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_design/providers/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: transaction.color.withOpacity(.8),
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Icon(
            transaction.iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          transaction.category,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text(
          "\$${transaction.value}",
          style: TextStyle(
              fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
