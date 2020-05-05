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
class MonthlyTransaction extends StatefulWidget {
  @override
  _MonthlyTransactionState createState() => _MonthlyTransactionState();
}

class _MonthlyTransactionState extends State<MonthlyTransaction> {
  @override
 
  Widget build(BuildContext context) {
    final _selectedDate = Provider.of<Date>(context).date;
    final transactions =
        Provider.of<Transactions>(context).monthly(_selectedDate);
    var incometrans = new List();
    var expensetrans = new List();
    var ttlIncome=0.0,ttlExpense=0.0;

    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].type == choosemode.Expense) {
        expensetrans.add(transactions[i]);
        ttlExpense+=transactions[i].price;
      } else {
        incometrans.add(transactions[i]);
        ttlIncome+=transactions[i].price;
      }
    }


    int maxday = 1;
    for (int i = 0; i < transactions.length; i++) {
      maxday = max(transactions[i].date.day, maxday);
    }
    print(maxday);


    var daysInc = new List.generate(maxday + 1, (_) => new List());
    for (int i = 1; i <= maxday; i++) {
      daysInc[i] =
          Provider.of<Transactions>(context).particularday(incometrans, i);
    }


    var daysExp = new List.generate(maxday + 1, (_) => new List());
    for (int i = 1; i <= maxday; i++) {
      daysExp[i] =
          Provider.of<Transactions>(context).particularday(expensetrans, i);
    }

    var formatter = new DateFormat('yMMMM');
    String _formatted = formatter.format(_selectedDate);

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            HeadDate(_formatted, ttlIncome, ttlExpense),
            Expanded(
              child: ListView.builder(
                itemCount: maxday + 1,
                itemBuilder: (ctx, i) => MonthlyView(daysInc[i], daysExp[i],i.toString()+" "+_formatted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
