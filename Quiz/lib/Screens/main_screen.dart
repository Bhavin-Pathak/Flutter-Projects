// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(
    this.StartQuiz, {
    super.key,
  });
  final void Function() StartQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/main.png',
            width: 250,
            height: 250,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Fun with Flutter",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              //! Function Call
              StartQuiz;
            },
            label: const Text(
              'Start',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
