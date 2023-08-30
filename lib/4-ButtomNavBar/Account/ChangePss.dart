// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/3-RegisterScreen.dart';

bool oldshowpassword = true;
bool newshowpassword = true;

TextEditingController oldepasswordcontrollor = TextEditingController();
TextEditingController newpasswordcontrollor = TextEditingController();

var formKey = GlobalKey<FormState>();

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  ChangePassword({email, oldPassword, newPassword}) async {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await currentUser?.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: oldepasswordcontrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Old password must not be empty";
                    }
                    return null;
                  },
                  obscureText: oldshowpassword,
                  keyboardType: TextInputType.visiblePassword,
                  // onFieldSubmitted: (value) {
                  //   print(value);
                  // },
                  // onChanged: (value){
                  //   print(value)
                  // },
                  decoration: InputDecoration(
                    labelText: "Old Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          oldshowpassword = !oldshowpassword;
                        });
                      },
                      icon: Icon(oldshowpassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: newpasswordcontrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "New password must not be empty";
                    }
                    return null;
                  },
                  obscureText: newshowpassword,
                  keyboardType: TextInputType.visiblePassword,
                  // onFieldSubmitted: (value) {
                  //   print(value);
                  // },
                  // onChanged: (value){
                  //   print(value)
                  // },
                  decoration: InputDecoration(
                    labelText: "New Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          newshowpassword = !newshowpassword;
                        });
                      },
                      icon: Icon(newshowpassword
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
                      if (formKey.currentState!.validate()) {
                        print(oldepasswordcontrollor);
                        print(newpasswordcontrollor);
                      }
                      await ChangePassword(
                        email: emailcontrollor.text,
                        oldPassword: oldepasswordcontrollor.text,
                        newPassword: newpasswordcontrollor.text,
                      );
                      print("password changed");
                    },
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
