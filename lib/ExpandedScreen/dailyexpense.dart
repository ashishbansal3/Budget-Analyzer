import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import '../providers/transactions.dart';
//import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import './expenses_of_day.dart';
import '../Screens/add_transaction.dart';
import '../providers/datee.dart';
import '../providers/transaction.dart';

class DailyExpense extends StatefulWidget {
  @override
  static const routeName = '/daily-expense';
  _DailyExpenseState createState() => _DailyExpenseState();
}

class _DailyExpenseState extends State<DailyExpense>
    with SingleTickerProviderStateMixin {
  @override
  DateTime _selectedDate = DateTime.now();
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _calendarController = CalendarController();
    _animationController.forward();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

// @override
// Widget build(BuildContext context) {
//   return TableCalendar(
//     calendarController: _calendarController,
//   );
// }
/* Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
     calendarController: _calendarController,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),

      // calendarStyle: CalendarStyle(
      //   outsideDaysVisible: false,
      //   weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
      //   holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      // ),
      // daysOfWeekStyle: DaysOfWeekStyle(
      //   weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      // ),
      // headerStyle: HeaderStyle(
      //   centerHeaderTitle: true,
      //   formatButtonVisible: false,
      // ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
      ),
      
        // todayDayBuilder: (context, date, _) {
        //   return Container(
        //     margin: const EdgeInsets.all(4.0),
        //     padding: const EdgeInsets.only(top: 5.0, left: 6.0),
        //     color: Colors.amber[400],
        //     width: 100,
        //     height: 100,
        //     child: Text(
        //       '${date.day}',
        //       style: TextStyle().copyWith(fontSize: 16.0),
        //     ),
        //   );
        // },
        //),

        );
 }*/
  Widget container(String text, double amount) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        color: Colors.purple[300],
        //  decoration: BoxDecoration(border: Border.all(width: 5)),
        child: Row(
          children: <Widget>[
            Text(
              text,
              softWrap: true,
            ),
            Spacer(),
             Text(
                '\$${amount}',
                style: TextStyle(color: Colors.black),
              ),
          ],
        ));
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  Widget TransactionType(List<Transaction> transactions) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (_, i) => Column(
                children: <Widget>[
                  ExpensesOfDay(transactions[i]),
                  Divider(),
                ],
              )),
    );
  }

  Widget build(BuildContext context) {
    final transactions =
        Provider.of<Transactions>(context).itemsToday(_selectedDate);
    final incometrans =
        Provider.of<Transactions>(context).incomeItem(transactions);
    final expensetrans =
        Provider.of<Transactions>(context).expenseItem(transactions);
    double ttlIncome = 0, ttlexpense = 0;
    for (int i = 0; i < incometrans.length; i++) {
      ttlIncome += incometrans[i].price.toDouble();
    }
    for (int i = 0; i < expensetrans.length; i++) {
      ttlexpense += expensetrans[i].price.toDouble();
    }
    print(incometrans.length);
    print(expensetrans.length);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AddTransaction.routeName, arguments: _selectedDate);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // GestureDetector(
            //   onTap:   _buildTableCalendarWithBuilders,
            //   child: Card(
            //     child: Text(
            //       DateFormat.Md().format(_selectedDate),
            //     ),
            //   ),
            // ),
            //_buildTableCalendarWithBuilders(),
            // GestureDetector(
            //   onDoubleTap: _presentDatePicker,
            //   child: DatePickerTimeline(
                
            //     _selectedDate,
            //     onDateChange: (date) {
            //       setState(() {
            //         _selectedDate = date;
            //       });
            //     },
            //   ),
            // ),
            container('Total Income:', ttlIncome),

            TransactionType(incometrans),
            container('Total Expense:', ttlexpense),
            TransactionType(expensetrans),
          ],
        ),
      ),
    );
  }
}
