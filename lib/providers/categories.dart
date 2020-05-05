import 'package:flutter/material.dart';
import './category.dart';
// flutter config --android-sdk
// C:\Users\Ashish\AppData\Local\Android\Sdk

class Categories with ChangeNotifier{
  List<Categoryy> _cat=[
    Categoryy(
      id: 'p1',
      icon: Icon(Icons.card_giftcard),
      category: 'gift',
    ),
    Categoryy(
      id: 'p2',
      icon: Icon(Icons.devices),
      category: 'devices',
    ),
    Categoryy(
      id: 'p4',
      icon: Icon(Icons.tv),
      category: 'Entertainment',
    ),
    Categoryy(
      id: 'p5',
      icon: Icon(Icons.tv),
      category: 'Education',
    ),
    Categoryy(
      id: 'p6',
      icon: Icon(Icons.tv),
      category: 'Personal Care',
    ),
    Categoryy(
      id: 'p7',
      icon: Icon(Icons.tv),
      category: 'Health',
    ),
    Categoryy(
      id: 'p8',
      icon: Icon(Icons.tv),
      category: 'Fitness',
    ),
    Categoryy(
      id: 'p9',
      icon: Icon(Icons.tv),
      category: 'Kids',
    ),
    Categoryy(
      id: 'p10',
      icon: Icon(Icons.tv),
      category: 'Food and Dining',
    ),
    Categoryy(
      id: 'p11',
      icon: Icon(Icons.tv),
      category: 'Gifts And',
    ),
    Categoryy(
      id: 'p12',
      icon: Icon(Icons.tv),
      category: 'Investment',
    ),
    Categoryy(
      id: 'p13',
      icon: Icon(Icons.tv),
      category: 'Bills And Utilities',
    ),
    Categoryy(
      id: 'p14',
      icon: Icon(Icons.tv),
      category: 'Auto And Transport',
    ),
    Categoryy(
      id: 'p15',
      icon: Icon(Icons.tv),
      category: 'Taxes',
    ),
    Categoryy(
      id: 'p16',
      icon: Icon(Icons.tv),
      category: 'Pet Care',
    ),
    Categoryy(
      id: 'p17',
      icon: Icon(Icons.tv),
      category: 'Travel',
    ),
    Categoryy(
      id: 'p18',
      icon: Icon(Icons.tv),
      category: 'Saving',
    ),
    Categoryy(
      id: 'p19',
      icon: Icon(Icons.tv),
      category: 'Clothing',
    ),
    Categoryy(
      id: 'p20',
      icon: Icon(Icons.tv),
      category: 'Misc',
    ),
    Categoryy(
      id: 'p21',
      icon: Icon(Icons.tv),
      category: 'Household',
    ),
    Categoryy(
      id: 'p22',
      icon: Icon(Icons.tv),
      category: 'Bike',
    ),
    Categoryy(
      id: 'p23',
      icon: Icon(Icons.tv),
      category: 'Books',
    ),
  ];

  List<Categoryy> get cati{
    return  _cat.toList();
  }

  void addCategory(Categoryy newCategory){
    //final Category _temp=Category(newCategory.category,newCategory.icon);
   // cat.add(_temp);
    notifyListeners();
  }

}