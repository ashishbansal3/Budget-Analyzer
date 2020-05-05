import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
enum choosemode{
  Expense,
  Income,
}
class Transaction with ChangeNotifier{
  final String category;
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final double price;
  final choosemode type;
  Transaction(
      {this.category,
      this.id,
      this.title,
      this.description,
      this.date,
      this.price,
      this.type=choosemode.Expense});
}
