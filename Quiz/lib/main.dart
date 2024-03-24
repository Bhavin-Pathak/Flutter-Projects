import 'package:flutter/material.dart';
import 'package:quiz/Screens/main_screen.dart';
import 'package:quiz/Screens/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = const MainScreen(setActiveScreen);
    super.initState();
  }

  void setActiveScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.purple,
                Colors.cyan,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
