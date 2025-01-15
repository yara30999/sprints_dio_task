import 'package:dio/dio.dart';
import 'package:sprints_dio_task/models/employee.dart';
import 'package:sprints_dio_task/services/shared_prefs.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Employee>> getEmployees() async {
    try {
      final response = await _dio.get(_url);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final employees = data.map((json) => Employee.fromJson(json)).toList();
        await AppPreferences.cacheEmployees(response.data);
        return employees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }
}
