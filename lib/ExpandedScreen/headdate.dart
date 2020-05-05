import 'package:flutter/material.dart';

class HeadDate extends StatelessWidget {
  @override
  var _formatted, _ttlIncome, _ttlExpense;
  double save=0.0;
  HeadDate(this._formatted, this._ttlIncome, this._ttlExpense);

  Widget build(BuildContext context) {
    save = (_ttlIncome - _ttlExpense);
    
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            width: double.infinity,
            // margin: EdgeInsets.all(5),
            child: Text(
              _formatted,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "Total Income: ",
                softWrap: true,
              ),
              Text(
                '\$${_ttlIncome.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                "Total Expense: ",
                softWrap: true,
              ),
              Text(
                '\$${_ttlExpense.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Spacer(),
              Text(
                'Saving:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              Text('\$${save.toStringAsFixed(2)}'),
            ],
          ),
        ],
      ),
    );
  }
}
