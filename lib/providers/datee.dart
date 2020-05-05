import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Date with ChangeNotifier{
  DateTime _selectedDate=DateTime.now();

  void updateDate(DateTime t){
    _selectedDate=t;
    notifyListeners();
  }
  DateTime get date{
    return _selectedDate;
  }
}