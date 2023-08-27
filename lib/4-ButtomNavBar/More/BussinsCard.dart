// ignore_for_file: file_names, camel_case_types
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class BussinsCard extends StatelessWidget {
  const BussinsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B475E),
      ),
      backgroundColor: const Color(0xFF2B475E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 110,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: 105,
                backgroundColor: Colors.yellowAccent,
                backgroundImage: AssetImage('images/sus.png')),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Ali Salah Dosoqi',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
          ),
          const Text(
            'Flutter Dev',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
            ),
          ),
          /////////////////////////////
          const Divider(
            color: Colors.grey,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 65,
              child: const Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.phone_android_rounded,
                    size: 36,
                    color: Color(0xFF2B475E),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Text(
                    '(+20) 1092353909',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer()
              ]),
            ),
          ),
          //////////////////////////
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 65,
              child: const Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.mail,
                    size: 36,
                    color: Color(0xFF2B475E),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Text(
                    'amjdos0190@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: const ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  FontAwesomeIcons.linkedin,
                  size: 32,
                  color: Color(0xFF2B475E),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'AlDos024',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
