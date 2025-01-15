import 'package:flutter/material.dart';
import 'package:sprints_dio_task/models/employee.dart';
import 'package:sprints_dio_task/screens/widgets/employee_card.dart';
import 'package:sprints_dio_task/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Employee>> employees;

  final ApiService service = ApiService();

  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  Future<void> getEmployeeData() async {
    try {
      final Future<List<Employee>> data = service.getEmployees();
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
      body: FutureBuilder<List<Employee>>(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blueGrey,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final employee = snapshot.data![index];
                return EmployeeCard(employee: employee);
              },
            );
          }
          return Center(child: Text('No employees found.'));
        },
      ),
    );
  }
}
