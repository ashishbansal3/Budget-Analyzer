import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyView extends StatelessWidget {
  @override
  var exptrans, inctrans,datee;
  var ttlexp = 0.0, ttlinc = 0.0, save = 0.0;
  MonthlyView(this.exptrans, this.inctrans,this.datee);

  Widget particluarTarnsaction(var trans) {
    return Row(
      children: <Widget>[
        Text(trans.title.toString()),
        Spacer(),
        Text('\$${trans.price.toString()}'),
      ],
    );
  }

  Widget transactions(String type, var trans, var amount) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            type,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: trans.length,
              itemBuilder: (ctx, j) => particluarTarnsaction(trans[j]),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "Total",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                '\$${amount}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    if (exptrans.length == 0 && inctrans.length == 0) return Container();

    for (int i = 0; i < exptrans.length; i++) {
      ttlexp += exptrans[i].price;
    }
    for (int i = 0; i < inctrans.length; i++) {
      ttlinc += inctrans[i].price;
    }
    save = ttlinc - ttlexp;
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 4,
        color: Colors.white70,
        shape: RoundedRectangleBorder(),
        margin: EdgeInsets.all(3),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text(
                datee,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Row(
              children: <Widget>[
                transactions('Income', inctrans, ttlinc.toStringAsFixed(2)),
                SizedBox(
                  width: 25,
                ),
                transactions('Expense', exptrans, ttlexp.toStringAsFixed(2)),
              ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                Spacer(),
                Text(
                  'Final Saving:',
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
      ),
    );
  }
}
