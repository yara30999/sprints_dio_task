import 'package:flutter/material.dart';
import 'package:sprints_dio_task/models/employee.dart';
import 'package:sprints_dio_task/screens/employee_details_screen.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  const EmployeeCard({
    super.key,
    required this.employee,
  });

  void onTab(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmployeeDetailsScreen(employee: employee),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: ListTile(
        titleTextStyle: TextStyle(color: Colors.white),
        subtitleTextStyle: TextStyle(color: Colors.white),
        leading: Hero(
          tag: 'avatar-${employee.id}',
          child: CircleAvatar(
            child: Text(employee.id.toString()),
          ),
        ),
        title: Hero(
          tag: 'name-${employee.id}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              employee.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        subtitle: Text(employee.email),
        onTap: () {
          onTab(context);
        },
      ),
    );
  }
}
