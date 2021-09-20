import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_design/providers/transaction.dart';
import 'package:flutter_finance_app_ui_design/widgets/transaction_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionCart extends StatefulWidget {
  final double height;
  final Function done;

  const TransactionCart(this.height, this.done);

  @override
  _TransactionCartState createState() => _TransactionCartState();
}

class _TransactionCartState extends State<TransactionCart> {
  int _date = int.parse(DateFormat("d").format(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final providedTransactions = Provider.of<Transactions>(context);

    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * .03,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: mediaQuery.size.width * .9,
        height: mediaQuery.size.height * widget.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        child: Column(
          children: [
            Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, right: 12),
                    child: InkWell(
                      onTap: () {
                        widget.done();
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _date--;
                            });
                          },
                          child: Icon(Icons.arrow_left),
                        ),
                        Text(
                          "$_date ${DateFormat("MMMM yyyy").format(DateTime.now())}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _date++;
                            });
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: providedTransactions.transactions.length,
                itemBuilder: (context, i) {
                  return TransactionItem(providedTransactions.transactions[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
