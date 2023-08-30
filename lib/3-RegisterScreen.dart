// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '4-ButtomNavBar/Layout.dart';

bool showpassword = true;

TextEditingController emailcontrollor = TextEditingController();
TextEditingController passwordcontrollor = TextEditingController();

TextEditingController namecontrollor = TextEditingController();
TextEditingController agecontrollor = TextEditingController();

var formKey = GlobalKey<FormState>();

class RegistarScreen extends StatefulWidget {
  const RegistarScreen({super.key});

  @override
  State<RegistarScreen> createState() => _Registar_screenState();
}

class _Registar_screenState extends State<RegistarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                /////////////////////////////////////////////////
                //                    name
                TextFormField(
                  controller: namecontrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name must not be empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                /////////////////////////////////////////////////////
                //                  Age
                TextFormField(
                  controller: agecontrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Age must not be empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                /////////////////////////////////////////
                ///                  Email
                TextFormField(
                  controller: emailcontrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email must not be empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  // onFieldSubmitted: (value) {
                  //   print(value);
                  // },
                  // onChanged: (value){
                  //   print(value)
                  // },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: passwordcontrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password must not be empty";
                    }
                    return null;
                  },
                  obscureText: showpassword,
                  keyboardType: TextInputType.visiblePassword,
                  // onFieldSubmitted: (value) {
                  //   print(value);
                  // },
                  // onChanged: (value){
                  //   print(value)
                  // },
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showpassword = !showpassword;
                        });
                      },
                      icon: Icon(showpassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      final user = User(
                          email: emailcontrollor.text,
                          name: namecontrollor.text,
                          age: int.parse(agecontrollor.text));

                      createUser(user);

                      if (formKey.currentState!.validate()) {
                        print(emailcontrollor);
                        print(passwordcontrollor);

                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailcontrollor.text.trim(),
                                password: passwordcontrollor.text.trim())
                            .then((value) {
                          print(value.user!.email);
                          print(value.user!.uid);
                          print(
                              "---------------------success------------------");
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => buttomNavBar(),
                            ),
                          );
                        }).catchError((Error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "There is an error with Email or Password, Try again")));
                          print(Error.toString());
                          print(
                              "---------------------Failed------------------");
                        });
                      }
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future createUser(User user) async {
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(emailcontrollor.text);
  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String id;
  final String email;
  final String name;
  final int age;

  User({
    this.id = ' ',
    required this.email,
    required this.name,
    required this.age,
  });
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'age': age, 'email': email};
}
