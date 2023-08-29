// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget BuildMealItem(String NameOfTheFood, String img) {
  return Container(
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.fill,
      ),
      shape: BoxShape.rectangle,
    ),
    child: Text(
      NameOfTheFood,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
        color: Colors.black,
        backgroundColor: Colors.white,
      ),
    ),
  );
}

Widget BuildTypeMeal(String NameOfTheFood, String img) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 180,
            width: 360,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
              shape: BoxShape.rectangle,
            ),
            child: Text(
              NameOfTheFood,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
