import 'package:flutter/material.dart';
import 'package:sprints_dio_task/screens/home_screen.dart';
import 'package:sprints_dio_task/services/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
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
