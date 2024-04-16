import 'package:flutter/material.dart';
import 'package:student/database_helper.dart'; // Import the database helper class

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getAllCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is loading
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If an error occurs
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If data is successfully fetched
            List<Map<String, dynamic>> courses = snapshot.data ?? [];
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${courses[index]['course_name']}'),
                  subtitle: Text('ID: ${courses[index]['course_id']}'),
                  // You can add more information here if needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
