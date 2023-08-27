// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '2-Loginscreen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLAstpage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.teal.shade700,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLAstpage = index == 2);
            },
            children: [
              buildPage(
                  color: Colors.white,
                  urlImage: 'images/Chef-Icon.gif',
                  title: "Welcome a board",
                  subtitle:
                      "I'm Ali Dosoqi , I made an App that have menu of a restrant that serves fast food , hope u enjoy :D"),
              buildPage(
                  color: Colors.green.shade100,
                  urlImage: 'images/3272764.png',
                  title: "What The App Do?",
                  subtitle:
                      "It show the menu of the restrant that may like : Pizza , Burger , Pasta and Drinks too.."),
              buildPage(
                  color: Colors.green.shade100,
                  urlImage: 'images/2-Cooked.png',
                  title: "Shall we begin ?",
                  subtitle: "Login to your Acount "),
            ]),
      ),
      bottomSheet: isLAstpage
          ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: const Text(
                      "SKIP",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black12,
                          activeDotColor: Colors.teal.shade700),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: const Text(
                      "NEXT",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
