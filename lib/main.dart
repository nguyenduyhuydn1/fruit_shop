import 'package:flutter/material.dart';
import 'package:fruit_shop/config/constants/size_config.dart';

import 'package:fruit_shop/presentation/screens/intro/intro_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: IntroScreen());
  }
}
