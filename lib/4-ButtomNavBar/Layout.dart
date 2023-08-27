import 'package:flutter/material.dart';
import 'package:restaurantapp/4-ButtomNavBar/Items.dart';
import 'package:restaurantapp/4-ButtomNavBar/More/More.dart';
import 'package:restaurantapp/4-ButtomNavBar/Account/UserAccount.dart';

class buttomNavBar extends StatefulWidget {
  const buttomNavBar({super.key});

  @override
  State<buttomNavBar> createState() => _buttomNavBarState();
}

class _buttomNavBarState extends State<buttomNavBar> {
  int currentIndex = 0;
  List<Widget> screens = [
    const ItemsScreen(),
    const UserAcountScreen(),
    const MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // var name = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.blue,
      //   child: Icon(Icons.add),
      // ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
              color: Colors.red,
            ),
            label: "Items",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color: Colors.blue,
            ),
            label: "Acount",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.black87,
            ),
            label: "More",
          ),
        ],
      ),
    );
  }
}
