import 'package:flutter/material.dart';
import 'package:fruit_shop/config/constants/constant.dart';
import 'package:fruit_shop/config/utils/colors.dart';

import 'package:fruit_shop/presentation/screens/home/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Voluptate culpa ullamco dolor tempor .",
                style: TextStyle(
                  color: red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Voluptate culpa ullamco dolor .",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Cupidatat ullamco ut nostrud aliqua ut veniam qui laborum enim dolor magna.",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 35),
              Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // border: Border.all(width: 1,),
                          color: white,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "SWIPE TO START",
                            style: TextStyle(fontSize: 18, color: white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 50)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
