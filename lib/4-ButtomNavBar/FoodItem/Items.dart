// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/4-ButtomNavBar/FoodItem/typeOfFood.dart';
// import 'package:restaurantapp/4-ButtomNavBar/FoodItem/typeOfFood.dart';

import 'MealWidget.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Food')
          .orderBy("as")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot domument) {
            Map<String, dynamic> data =
                domument.data()! as Map<String, dynamic>;
            return ListTile(
              //title: Text(data['name']),
              title: BuildMealItem(data['name'], data['img']),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TypeOfFood(maleName: data['name']),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    ));
  }
}


// SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             child: Column(children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.grey[300],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 12),
//                   child: Row(
//                     children: [
//                       Icon(Icons.search),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text("searsh for u fav meal")
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) => BuildMealItem(),
//                 separatorBuilder: (context, index) => SizedBox(
//                   height: 20,
//                 ),
//                 itemCount: 10,
//               )
//             ]),
//           ),
//         ),
//       ),
