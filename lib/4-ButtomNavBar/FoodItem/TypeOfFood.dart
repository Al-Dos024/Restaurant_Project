// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/4-ButtomNavBar/FoodItem/MealWidget.dart';

// import 'MealWidget.dart';

class TypeOfFood extends StatelessWidget {
  TypeOfFood({required this.maleName, super.key});

  String maleName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(maleName).snapshots(),
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
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                // title: Text(data['name']),
                title: BuildTypeMeal(data['name'], data['img']),

                onTap: () {},
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
