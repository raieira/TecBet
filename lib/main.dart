import 'package:flutter/material.dart';
import 'views/pages/home_page.dart';

void main() {
  runApp(const TecBetApp());
}

class TecBetApp extends StatelessWidget {
  const TecBetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TecBet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
