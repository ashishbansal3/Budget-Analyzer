import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

class Transactions with ChangeNotifier {
  List<Transaction> _items = [
    Transaction(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Income,
    ),
    Transaction(
      id: 'p4',
      title: 'shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Expense,
    ),
    Transaction(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Income,
    ),
    Transaction(
      id: 'p4',
      title: 'shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Expense,
    ),
    Transaction(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Income,
    ),
    Transaction(
      id: 'p4',
      title: 'shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Expense,
    ),
    Transaction(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Income,
    ),
    Transaction(
      id: 'p4',
      title: 'shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime.now(),
      type: choosemode.Expense,

    ),
    Transaction(
      id: 'p4',
      title: 'shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime(2020,3,16),
      type: choosemode.Expense,
    ),
    Transaction(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime(2020,3,16),
      type: choosemode.Income,
    ),
    Transaction(
      id: 'p4',
      title: 'shoes',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      date: DateTime(2020,3,16),
      type: choosemode.Expense,
    ),
  ];
  List<Transaction> get item {
    return _items.toList();
  }

  List<Transaction> incomeItem(List<Transaction> dayitem) {
    print('income');
    return dayitem.where((tran) => tran.type == choosemode.Income).toList();
  }

  List<Transaction> expenseItem(List<Transaction> dayitem) {
    print('expense');
    return dayitem.where((tran) => tran.type == choosemode.Expense).toList();
  }

  List<Transaction> itemsToday(DateTime t) {
    return _items
        .where((tran) =>
            tran.date.day == t.day &&
            tran.date.month == t.month &&
            tran.date.year == t.year)
        .toList();
  }

  List<Transaction> monthly(DateTime t) {
    return _items
        .where((tran) => tran.date.month == t.month && tran.date.year == t.year)
        .toList();
  }
  List<Transaction> yearly(DateTime t) {
    return _items
        .where((tran) => tran.date.year == t.year)
        .toList();
  }


  List<dynamic> particularday(var _item, int i) {
    return _item.where((tran) => tran.date.day == (i)).toList();
  }
  List<dynamic> particularmonth(var _item, int i) {
    return _item.where((tran) => tran.date.month == (i)).toList();
  }
  void addTransaction(Transaction expense) {
    final newExpense = Transaction(
      category: ' ',
      id: DateTime.now().toString(),
      title: expense.title,
      description: expense.description,
      date: expense.date,
      price: expense.price,
      type: expense.type,
    );
    _items.add(newExpense);
    // print('shi a');
    notifyListeners();
  }

  void deleteTransaction(String id) {
    _items.removeWhere((tr) => tr.id == id);
    notifyListeners();
  }

  Transaction findById(String key) {
    return _items.firstWhere((prod) => key == prod.id);
    //notifyListeners();
  }

  void editTransaction(String id, Transaction newTransaction) {
    final int index = _items.indexWhere((tr) => tr.id == id);
    if (index >= 0) {
      _items[index] = newTransaction;
      notifyListeners();
    } else
      print('...');
  }
}
