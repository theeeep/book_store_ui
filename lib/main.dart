import 'package:book_store_ui/common/color_extention.dart';
import 'package:book_store_ui/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: TColor.primary,
        fontFamily: 'SF Pro Text',
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingView(),
    );
  }
}
