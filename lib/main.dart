import 'package:flutter/material.dart';
import 'student_form.dart';
import 'student_page.dart';
//import 'course_page';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
    ,
      home: HomePage(),
      routes: {
        '/student': (context) => StudentPage(), // Define the route for StudentPage
        //'/course': (context) => CoursePage(),
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
              title: Text('Student'),
              onTap: () {
                Navigator.pushNamed(context, '/student');
              },
            ),
            ListTile(
              title: Text('Student Form'), // Change the title to 'Student Form'
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentForm()),
                );
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

