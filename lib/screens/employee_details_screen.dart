import 'package:flutter/material.dart';
import 'package:sprints_dio_task/models/employee.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Text(
                  employee.id.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Username: ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextSpan(text: employee.name),
                ],
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Email: ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextSpan(text: employee.email),
                ],
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Phone: ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextSpan(text: employee.phone),
                ],
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Website: ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextSpan(text: employee.website),
                ],
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Address: ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextSpan(
                      text:
                          '${employee.address.street}, ${employee.address.suite}, ${employee.address.city}, ${employee.address.zipcode}'),
                ],
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Company: ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextSpan(
                    text:
                        '${employee.company.name} - "${employee.company.catchPhrase}" (${employee.company.bs})',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
