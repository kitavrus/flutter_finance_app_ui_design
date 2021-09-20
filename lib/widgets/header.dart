import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_design/model/expense.dart';
import 'package:flutter_finance_app_ui_design/widgets/expens_charts.dart';

class Header extends StatelessWidget {
  final Function addTransaction;

  Header(this.addTransaction);

  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
      id: "Expense",
      domainFn: (Expense expense, _) => expense.category,
      measureFn: (Expense expense, _) => expense.value,
      labelAccessorFn: (Expense expense, _) => '\$${expense.value}',
      colorFn: (Expense expense, _) =>
          charts.ColorUtil.fromDartColor(expense.color),
      data: [
        Expense('Business', 149.99, Color(0xff40bad5)),
        Expense('Meals', 143.99, Color(0xff40ba5b)),
        Expense('Gifts', 49.99, Color(0xff43baca)),
        Expense('Gaming', 27.35, Color(0xff48ba43)),
        Expense('Entertainment', 34.99, Color(0xff60ba51)),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.4,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: ExpenseChart(
                _series,
                animate: true,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    addTransaction();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  child: Container(
                      width: 124,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Add transaction",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  child: Container(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Report",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Transaction',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
