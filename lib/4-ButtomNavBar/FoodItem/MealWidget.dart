import 'package:flutter/material.dart';

Widget BuildMealItem(String NameOfTheFood, String img) {
  return Container(
    child: Text(
      "$NameOfTheFood",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
        color: Colors.black,
        backgroundColor: Colors.white,
      ),
    ),
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('$img'),
        fit: BoxFit.fill,
      ),
      shape: BoxShape.rectangle,
    ),
  );
}

Widget BuildTypeMeal(String NameOfTheFood, String img) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('$img'), fit: BoxFit.fill),
              shape: BoxShape.rectangle,
            ),
            child: Text(
              "$NameOfTheFood",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    ],
  );
}
