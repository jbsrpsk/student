import 'package:flutter/material.dart';
import 'package:student/student_form.dart'; // Import your student form page
import 'package:student/student_page.dart'; // Import your student page
import 'package:student/course_form.dart'; // Import your course form page
import 'package:student/marks_form.dart'; // Import your marks form page
import 'package:student/course_page.dart'; // Import your course page
import 'package:student/marks_page.dart'; // Import your view marks page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/studentForm': (context) => StudentForm(), // Define the route for StudentForm
        '/studentPage': (context) => StudentPage(), // Define the route for StudentPage
        '/course': (context) => CourseForm(), // Define the route for CourseForm
        '/marks': (context) => MarksForm(), // Define the route for MarksForm
        '/viewCourses': (context) => CoursePage(), // Define the route for viewing courses
        '/viewMarks': (context) => ViewMarksPage(), // Define the route for viewing marks
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Add Student'),
              onTap: () {
                Navigator.pushNamed(context, '/studentForm'); // Navigate to '/studentForm' route
              },
            ),
            ListTile(
              title: Text('Add Course'),
              onTap: () {
                Navigator.pushNamed(context, '/course');
              },
            ),
            ListTile(
              title: Text('Add Marks'),
              onTap: () {
                Navigator.pushNamed(context, '/marks');
              },
            ),
            ListTile(
              title: Text('View Students'), // Updated text to 'View Students'
              onTap: () {
                Navigator.pushNamed(context, '/studentPage'); // Navigate to '/studentPage' route
              },
            ),
            ListTile(
              title: Text('View Courses'),
              onTap: () {
                Navigator.pushNamed(context, '/viewCourses');
              },
            ),
            ListTile(
              title: Text('View Marks'),
              onTap: () {
                Navigator.pushNamed(context, '/viewMarks');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the homepage'),
      ),
    );
  }
}
