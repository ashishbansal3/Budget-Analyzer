import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
import '../providers/transaction.dart';
import './add_edit_transaction.dart';

class EditTransaction extends StatefulWidget {
  @override
  static const routeName='/edit';
  _EditTransactionState createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  @override
  var _addTransaction = Transaction(
    category: null,
    id: null,
    title: '',
    description: '',
    date: DateTime.now(),
    price: 0,
    type: choosemode.Expense,
  );
  var _initalValue = {
    'id': null,
    'category': null,
    'title': '',
    'description': '',
    'date': null,
    'price': '',
      'type': null,
  };
  bool _init = true;
  void didChangeDependencies() {
    if (_init) {
      print('gfd');
      final transKey = ModalRoute.of(context).settings.arguments as String;
      //   final selectedDate=Provider.of<Expense>(context).da;
      if (transKey != null) {
        //for editing
        _addTransaction = Provider.of<Transactions>(context, listen: false)
            .findById(transKey);
        _initalValue = {
          'id': _addTransaction.id,
          'category': _addTransaction.category,
          'title': _addTransaction.title,
          'description': _addTransaction.description,
          'date': _addTransaction.date.toString(),
          'price': _addTransaction.price.toString(),
          'type': _addTransaction.type.toString(),
        };
      }
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Transaction'),
        ),
        body: AddEditTransaction(_addTransaction, _initalValue));
  }
}
