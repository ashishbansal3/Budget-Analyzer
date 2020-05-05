import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/add_edit_transaction.dart';
import '../providers/transactions.dart';
import '../providers/transaction.dart';

class AddTransaction extends StatefulWidget {
  static const routeName='/add';
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  bool _init = true;
  var _addTransaction = Transaction(
    category: null,
    id: null,
    title: '',
    description: '',
    date: DateTime.now(),
    price: 0,
    type: choosemode.Expense,
  );

  void didChangeDependencies() {
    if (_init) {
      final datee = ModalRoute.of(context).settings.arguments as DateTime;
      _addTransaction = Transaction(
        category: _addTransaction.category,
        id: _addTransaction.id,
        title: _addTransaction.title,
        description: _addTransaction.description,
        date: datee,
        price: _addTransaction.price,
        type: _addTransaction.type
      );
    }
    _init = false;
    super.didChangeDependencies();
  }

  var _initalValue = {
    'id': null,
    'category': null,
    'title': '',
    'description': '',
    'date': null,
    'price': '',
    'type': null,
  };

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Transaction'),
        ),
        body: AddEditTransaction(_addTransaction, _initalValue));
  }
}
