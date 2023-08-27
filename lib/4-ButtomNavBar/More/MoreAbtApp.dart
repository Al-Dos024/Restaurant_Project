// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MoreAbtApp extends StatelessWidget {
  const MoreAbtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("What the App Do?"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.0), //Use this code to make rounded corners
              color: const Color.fromARGB(255, 63, 167, 150),
            ),
            height: 150,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('images/Chef-Icon.gif'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    "I made an application which serve the menu of a restrant",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          ///////////////////////////////////////
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.0), //Use this code to make rounded corners
              color: const Color.fromARGB(255, 63, 167, 150),
            ),
            height: 150,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('images/loginmangment.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    "A Customized Login and Logout by Email & password and Change of the password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          ////////////////////////////////////////////
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.0), //Use this code to make rounded corners
              color: const Color.fromARGB(255, 63, 167, 150),
            ),
            height: 150,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage:
                        AssetImage('images/how_to_become_a_ui_designer.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    "UI with onboard Screen and some cool trickes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          ////////////////////////////////////////
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.0), //Use this code to make rounded corners
              color: const Color.fromARGB(255, 63, 167, 150),
            ),
            height: 150,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('images/Database.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    "Linked all that with Firebase Cloud and matched with real information",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30,
            width: 125,
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.0), //Use this code to make rounded corners
              color: Colors.amber,
            ),
            child: const Text(
              "Thank You ^o^",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
