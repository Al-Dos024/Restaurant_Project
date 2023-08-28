import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/4-ButtomNavBar/FoodItem/MealWidget.dart';

// import 'MealWidget.dart';

class TypeOfFood extends StatelessWidget {
  const TypeOfFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Pizza').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("wrong"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot domument) {
                Map<String, dynamic> data =
                    domument.data()! as Map<String, dynamic>;
                return ListTile(
                  //title: Text(data['name']),
                  title: BuildTypeMeal(data['name'], data['img']),
                  onTap: () {},
                );
              }).toList(),
            );
          },
        ));
  }
}
