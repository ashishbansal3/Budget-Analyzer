import 'package:flutter_complete_guide/ExpandedScreen/dailyexpense.dart';
import 'package:flutter_complete_guide/ExpandedScreen/description_of_expense.dart';
import 'package:flutter_complete_guide/Screens/edit_transaction.dart';
import './ExpandedScreen/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ExpandedScreen/category.dart';
import './providers/transactions.dart';
import './Screens/add_transaction.dart';
import './providers/transaction.dart';
import 'package:intl/date_symbol_data_local.dart';
import './providers/category.dart';
import './Screens/bottom_navigation_bar.dart';
import './providers/categories.dart';
import './providers/datee.dart';
import './ExpandedScreen/dailyexpense.dart';
void main(){
   initializeDateFormatting().then((_) => runApp(MyApp()));
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider.value(
          value: Transactions(),
        ),
        ChangeNotifierProvider.value(
          value: Transaction(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: Date(),
        )
      ],
         child: MaterialApp(
        title: 'Home',
         theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
        home: TabBarr(),
        routes: {
          AddTransaction.routeName: (ctx)=> AddTransaction(),
          EditTransaction.routeName:(ctx)=>EditTransaction(),
          TabBarr.routeName: (ctx)=>TabBarr(),
         CategoryExpense.routeName: (ctx)=>CategoryExpense(),
        DescriptionOfExpense.routeName: (ctx)=>DescriptionOfExpense(),
        },
      ),
    );
  }

}
