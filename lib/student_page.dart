import 'package:flutter/material.dart';
import 'package:student/database_helper.dart'; // Import your DatabaseHelper

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late Future<List<Map<String, dynamic>>> _students;

  @override
  void initState() {
    super.initState();
    _students = DatabaseHelper().getAllStudents(); // Fetch all students from the database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _students,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> students = snapshot.data ?? [];
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> student = students[index];
                return ListTile(
                  title: Text('${student['first_name']} ${student['last_name']}'),
                  subtitle: Text('Student ID: ${student['student_id']}'),
                  trailing: Icon(Icons.person), // You can replace this with any icon you like
                );
              },
            );
          }
        },
      ),
    );
  }
}
