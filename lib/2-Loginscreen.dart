// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '1-Onboarding.dart';
import '3-RegisterScreen.dart';
import '4-ButtomNavBar/Layout.dart';

bool showpassword = true;

TextEditingController emailcontrollor = TextEditingController();
TextEditingController passwordcontrollor = TextEditingController();

var formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const OnBoarding()));
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
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
                      if (formKey.currentState!.validate()) {
                        print(emailcontrollor);
                        print(passwordcontrollor);
                        // await ApiProvider().userLoginEmail(
                        //     email: emailcontrollor.text,
                        //     password: passwordcontrollor.text);

                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
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
                        }).catchError(
                          (Error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "The Email or password not matching, Try again")));
                            print(Error.toString());
                            print(
                                "---------------------Failed------------------");
                            // TextFormField(
                            //     controller: passwordcontrollor,
                            //     validator: (value) {
                            //       if (value!.isNotEmpty)
                            //         return "The Email Or password is wrong , try again";
                            //       else
                            //         return null;
                            //     });
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont Have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistarScreen()));
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
