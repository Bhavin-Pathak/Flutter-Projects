import 'package:flutter/material.dart';

final pages = [
  Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Image.asset(
            'assets/Image/Swipe.png',
            width: 300,
            height: 300,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Swipe',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  ),
  Container(
    width: double.infinity,
    color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset('assets/Image/Secure.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Swipe Q',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  ),
  Container(
    width: double.infinity,
    color: Colors.blue,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset('assets/Image/Support.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Swipe W',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  ),
  Container(
    width: double.infinity,
    color: Colors.teal,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Center(child: Image.asset('assets/Image/Teamwork.png')),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Swipe E',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.forward),
                label: const Text('Next Move'))
          ],
        ),
      ],
    ),
  ),
];
