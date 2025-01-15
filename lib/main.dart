import 'package:flutter/material.dart';
import 'package:sprints_dio_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sprints dio task',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
