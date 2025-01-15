import 'package:flutter/material.dart';
import 'package:sprints_dio_task/models/employee.dart';
import 'package:sprints_dio_task/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Employee> employees = [];

  final ApiService service = ApiService();

  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  Future<void> getEmployeeData() async {
    try {
      final data = await service.getEmployees();
      setState(() {
        employees = data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employees List')),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Text(employee.name);
        },
      ),
    );
  }
}
