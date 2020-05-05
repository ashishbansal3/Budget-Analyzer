import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';

class CategoryExpense extends StatelessWidget {
  @override
  static const routeName = '/category-expense';
  Widget build(BuildContext context) {
    var categoryImport = Provider.of<Categories>(context).cati;
    child:
    print(categoryImport.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: categoryImport.length,
        itemBuilder: (_, i) => Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Text(categoryImport[i].category[0]),
              ),
              title: Text(categoryImport[i].category),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
          child: RaisedButton.icon(
        icon: Icon(Icons.add),
        label: Text('Add Category'),
        onPressed: () {},
        color: Colors.purple[300],
      )),
    );
  }
}
