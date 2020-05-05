import 'package:flutter/material.dart';
import './montly.dart';
import './dailyexpense.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';
import './yearly.dart';
class TabBarr extends StatefulWidget {
  @override
  static const routeName = '/expense';

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<TabBarr> {
   var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  // @override
  // void didChangeDependencies(){
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Transactions>(context).item(_)( {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  Widget build(BuildContext context) {
  
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: AppBar(
            title: Text('Welcome to Expense Manager!'),
          ),
          bottom: TabBar(
           
            tabs: <Widget>[Text('Daily'), Text('Monthly'), Text('Yearly')],
          ),
        ),
        body: TabBarView(
              children: <Widget>[
                DailyExpense(),
                MonthlyTransaction(),
                YearlyTransaction(),
              ],
            ),
        ),
      );
  }
}
