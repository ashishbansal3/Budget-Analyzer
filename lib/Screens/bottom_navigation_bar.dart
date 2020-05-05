import 'package:flutter/material.dart';
import '../ExpandedScreen/tab_bar.dart';
import '../ExpandedScreen/category.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  int _selectedIndex=0;

  void _newIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  Widget build(BuildContext context) {
    final List<Object> _children = [
    TabBarr(),
    CategoryExpense(),
    
  ];

    return Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('Expense'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Add Category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gradient),
              title: Text('Graphs'),
              
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _newIndex,
        ),
      );
  }
}
