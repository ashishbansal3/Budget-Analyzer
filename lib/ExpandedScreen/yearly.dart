import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/ExpandedScreen/headdate.dart';
import 'package:flutter_complete_guide/providers/transaction.dart';
import '../providers/transactions.dart';
import 'package:provider/provider.dart';
import '../providers/datee.dart';
import './expenses_of_day.dart';
import 'package:intl/intl.dart';
import './monthlyview.dart';
import './headdate.dart';

class YearlyTransaction extends StatefulWidget {
  @override
  _YearlyTransactionState createState() => _YearlyTransactionState();
}

class _YearlyTransactionState extends State<YearlyTransaction> {
  @override
  Widget build(BuildContext context) {
    final _selectedDate = Provider.of<Date>(context).date;
    final transactions =
        Provider.of<Transactions>(context).yearly(_selectedDate);
    var incometrans = new List();
    var expensetrans = new List();
    var ttlIncome = 0.0, ttlExpense = 0.0;

    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].type == choosemode.Expense) {
        expensetrans.add(transactions[i]);
        ttlExpense += transactions[i].price;
      } else {
        incometrans.add(transactions[i]);
        ttlIncome += transactions[i].price;
      }
    }

    int maxmonth = 1;
    for (int i = 0; i < transactions.length; i++) {
      maxmonth = max(transactions[i].date.month, maxmonth);
    }
    print(maxmonth);

    var monthInc = new List.generate(maxmonth + 1, (_) => new List());
    for (int i = 1; i <= maxmonth; i++) {
      monthInc[i] =
          Provider.of<Transactions>(context).particularmonth(incometrans, i);
    }

    var monthExp = new List.generate(maxmonth + 1, (_) => new List());
    for (int i = 1; i <= maxmonth; i++) {
      monthExp[i] =
          Provider.of<Transactions>(context).particularmonth(expensetrans, i);
    }
    String temp;
    var formatter = new DateFormat('yyyy');
    String _formatted = formatter.format(_selectedDate);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            HeadDate(_formatted, ttlIncome, ttlExpense),
            Expanded(
              child: ListView.builder(
                itemCount: maxmonth + 1,
                itemBuilder: (ctx, i) {
                  formatter = new DateFormat('yMMMM');
                  if (monthExp[i].length == 0 && monthInc[i].length == 0)
                    return Container();
                  else if (monthInc[i].length > 0)
                    temp = formatter.format(monthInc[i][0].date);
                  else if (monthExp[i].length > 0)
                    temp = formatter.format(monthExp[i][0].date);
        

                  return MonthlyView(monthInc[i], monthExp[i], temp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
