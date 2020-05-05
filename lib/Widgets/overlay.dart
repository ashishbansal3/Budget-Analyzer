// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/categories.dart';
// import '../providers/category.dart';

// class Temp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     final _categories=Provider.of<Categories>(context).cati;
//     return   Opacity(
//               opacity: 1,
//               child: GridView.builder(
//                 itemCount: _categories.length,
//                 padding: EdgeInsets.all(15),
//                 gridDelegate:
//                     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//                 itemBuilder: (_, i) {
//                   return GestureDetector(
//                     child: Card(
//                       elevation: 3,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           _categories[i].icon,
//                           Text(
//                             _categories[i].category,
//                             softWrap: true,
//                             textAlign: TextAlign.center,
//                           )
//                         ],
//                       ),
//                     ),
//                     onTap: () {  
//                            Future.delayed(Duration(microseconds: 3));
//                            },
//                   );
//                 },
//               ),
//             );
// }
// }
