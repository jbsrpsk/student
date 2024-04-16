import 'package:flutter/material.dart';
import 'package:student/database_helper.dart'; // Import the database helper class

class CourseForm extends StatefulWidget {
  @override
  _CourseFormState createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseIdController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _courseIdController,
                decoration: InputDecoration(labelText: 'Course ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _courseNameController,
                decoration: InputDecoration(labelText: 'Course Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _courseDescriptionController,
                decoration:
                InputDecoration(labelText: 'Course Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> course = {
                      'course_id': _courseIdController.text,
                      'course_name': _courseNameController.text,
                      'course_description': _courseDescriptionController.text,
                    };
                    DatabaseHelper().insertCourse(course);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Course added successfully')),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
