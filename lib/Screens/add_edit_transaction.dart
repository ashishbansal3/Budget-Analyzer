import 'package:flutter/material.dart';
import '../providers/transactions.dart';
import '../providers/transaction.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';
import '../providers/transaction.dart';
class AddEditTransaction extends StatefulWidget {
  static const routeName = '/add-transaction';
  Transaction _addTransaction;
  Map<String, String> initalValue;
  AddEditTransaction(this._addTransaction, this.initalValue);
  @override
  _AddEditTransactionState createState() => _AddEditTransactionState();
}

class _AddEditTransactionState extends State<AddEditTransaction> {
  final _toPrice = FocusNode();
  final _toDescription = FocusNode();
  final _categoryController = TextEditingController();
  //final _descriptionController = TextEditingController();
  final _overlayFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  OverlayEntry _overlayEntry;
  var _isLoading = false;
  var _isFocus = false;
  @override
  void initState() {
    _toDescription.addListener(_updateDescription);

    super.initState();
  }

  @override
  void dispose() {
    _toDescription.removeListener(_updateDescription);
    _toDescription.dispose();
    _toPrice.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _updateDescription() {
    if (!_toDescription.hasFocus) {
      setState(() {});
    }
  }

  var _tempMode="Expense";
  var _mode=choosemode.Expense;
  void _toggelMoneyMethod(){
      setState(() {
         if(_mode==choosemode.Expense){
      _mode=choosemode.Income;
      _tempMode="Income";
         }
    else{
      _mode=choosemode.Expense;
      _tempMode="Expense";
    }
      });
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (widget._addTransaction.id != null) {
      print('sad');
      await Provider.of<Transactions>(context, listen: false)
          .editTransaction(widget._addTransaction.id, widget._addTransaction);
    } else {
      print('in add vali');
      try {
        await Provider.of<Transactions>(context, listen: false)
            .addTransaction(widget._addTransaction);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('there is an error'),
                  content: Text('Something Went Wrong!'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
        //     } finally{
        //   setState(() {
        //     _isLoading = false;
        //   });
        //   Navigator.of(context).pop();
        // }
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  void _callOverlay() {
    // _categoryController.addListener(() {
    //   if(_categoryController.hasListeners){
    //   _overlayEntry = _createOverlayEntry();
    //   Overlay.of(context).insert(_overlayEntry);
    //   }else{
    //     _overlayEntry.remove();
    //   }
    // });
_overlayFocusNode.addListener(() {
      if (_overlayFocusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    final _categories = Provider.of<Categories>(context).cati;
    OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Opacity(
        opacity: 1,
        child: GridView.builder(
          itemCount: _categories.length,
          padding: EdgeInsets.all(15),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (_, i) {
            return GestureDetector(
              child: Card(
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _categories[i].icon,
                    Text(
                      _categories[i].category,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  //    _categoryController.addListener(_categories[i].category);
                  _categoryController.text = _categories[i].category;
                  //   _selectedCategory = _categories[i].category.toString();
                });
                entry.remove();
              },
            );
          },
        ),
      ),
    );
    return entry;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    FlatButton(onPressed: _toggelMoneyMethod,child: Text(_tempMode),),
                    TextFormField(
                        initialValue: widget.initalValue['title'],
                        decoration: InputDecoration(labelText: 'Title'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_toPrice);
                        },
                        validator: (value) {
                          if (value == null) return 'Please Enter A Value';
                          return null;
                        },
                        onSaved: (value) {
                          widget._addTransaction = Transaction(
                            category: widget._addTransaction.category,
                            id: widget._addTransaction.id,
                            title: value,
                            description: widget._addTransaction.description,
                            date: widget._addTransaction.date,
                            price: widget._addTransaction.price,
                            type: _mode,
                          );
                        }),
                    TextFormField(
                        initialValue: widget.initalValue['price'],
                        decoration: InputDecoration(labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _toPrice,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_toDescription);
                        },
                        validator: (value) {
                          if (value == null) return 'Please Enter A Value';
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number.';
                          }
                          if (double.parse(value) <= 0)
                            return 'Please enter a number greater than zero.';
                          return null;
                        },
                        onSaved: (value) {
                          widget._addTransaction = Transaction(
                            category: widget._addTransaction.category,
                            id: widget._addTransaction.id,
                            title: widget._addTransaction.title,
                            description: widget._addTransaction.description,
                            date: widget._addTransaction.date,
                            price: double.parse(value),
                            type: _mode,
                          );
                        }),
                    TextFormField(
                      initialValue: widget.initalValue['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _toDescription,
                      // controller: _descriptionController,
                      // onFieldSubmitted: (_) {
                      //   _saveForm();
                      // },
                      onSaved: (value) {
                        widget._addTransaction = Transaction(
                          category: widget._addTransaction.category,
                          id: widget._addTransaction.id,
                          title: widget._addTransaction.title,
                          description: value,
                          date: widget._addTransaction.date,
                          price: widget._addTransaction.price,
                          type: _mode,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a description.';
                        }
                        if (value.length < 0) {
                          return 'Should be at least 10 characters long.';
                        }
                        return null;
                      },
                    ),
                  
                    TextFormField(
                      controller: _categoryController,
                      focusNode: this._overlayFocusNode,
                      onTap: _callOverlay,
                      decoration: InputDecoration(labelText: 'Category'),
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        widget._addTransaction = Transaction(
                          category: value,
                          id: widget._addTransaction.id,
                          title: widget._addTransaction.title,
                          description: widget._addTransaction.description,
                          date: widget._addTransaction.date,
                          price: widget._addTransaction.price,
                          type: _mode,
                        );
                      },
                    ),
                    //      Center(
                    //   child: RaisedButton(
                    //   // onPressed: () {
                    //   //   focusNode: this.fo
                    //   // //showOverlay(context);
                    //   //   //Temp();
                    //   //         },
                    //   child: Text(
                    //   "Show My Icon",
                    //   style: TextStyle(color: Colors.white),
                    //   ),
                    // color: Colors.green,
                    //   ),
                    //   ),
                    GestureDetector(
                      onTap: _saveForm,
                      child: Icon(Icons.save),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
