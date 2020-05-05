import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/cateory_opacity.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
import './tab_bar.dart';
import '../providers/transaction.dart';
import '../Screens/edit_transaction.dart';
import './description_of_expense.dart';
import '../Screens/add_transaction.dart';
import '../Widgets/cateory_opacity.dart';

class ExpensesOfDay extends StatelessWidget {
  @override
  // final String title;
  // final Double price;

  // ExpensesOfDay(this.title);
  final Transaction trans;
  ExpensesOfDay(this.trans);
  //  _showMenu(final context) async {
  //   await showMenu(
  //     position: RelativeRect.fromLTRB(100, 400, 100, 400),
  //     context: context,
  //     items: [
  //       PopupMenuItem(
  //         child: Text("InduceSmile.com"),
  //       ),
  //       PopupMenuItem(
  //         child: Text("Flutter.io"),
  //       ),
  //       PopupMenuItem(
  //         child: Text("Google.com"),
  //       ),
  //     ],
  //     elevation: 8.0,
  //   );
  // }
  _sDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Are You Sure?'),
        content: Text('Do you want to remove this Transaction?'),
        elevation: 5,
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    var scaffold = Scaffold.of(context);
    // final transaction= Provider.of<Transactions>(context);
    // final transactionItems=transaction.item;
    return Dismissible(
      key: ValueKey(trans.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are You Sure?'),
            content: Text('Do you want to remove this Transaction?'),
            elevation: 5,
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) async {
        try {
          await Provider.of<Transactions>(context).deleteTransaction(trans.id);
        } catch (error) {
          //  SnackBar(content: Title('adf'),);
          scaffold.showSnackBar(SnackBar(
            content: Text(
              'Deleting Not Possible',
              textAlign: TextAlign.center,
            ),
          ));
        }
      },
      child: GestureDetector(
        onLongPress: () {},
        onTap: () {
          Navigator.of(context).pushNamed(DescriptionOfExpense.routeName);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                trans.title,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ),

            Spacer(),
            Container(
              child: Text(
                '\$${trans.price}',
                style: TextStyle(color: Colors.black38),
              ),
            ),
            SizedBox(
              width: 35,
            ),

            // Title(title: '\$${trans.price}',),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditTransaction.routeName, arguments: trans.id);
              },
            ),
          
            SizedBox(
              width: 8,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                Provider.of<Transactions>(context).deleteTransaction(trans.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
