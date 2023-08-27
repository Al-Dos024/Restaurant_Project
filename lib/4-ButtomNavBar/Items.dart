import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text("searsh for u fav meal")
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BuildMealItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: 10,
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Widget BuildMealItem() {
  return Container(
    child: TextButton(
      onPressed: () {},
      child: Text(
        "Pizza",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
    ),
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/pizza.jpg'),
        fit: BoxFit.fill,
      ),
      shape: BoxShape.rectangle,
    ),
  );
}
