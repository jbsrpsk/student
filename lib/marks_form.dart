import 'package:flutter/material.dart';
import 'package:student/database_helper.dart'; // Import the database helper class

class MarksForm extends StatefulWidget {
  @override
  _MarksFormState createState() => _MarksFormState();
}

class _MarksFormState extends State<MarksForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _courseIdController = TextEditingController();
  final TextEditingController _marksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Marks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(labelText: 'Student ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a student ID';
                  }
                  return null;
                },
              ),
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
                controller: _marksController,
                decoration: InputDecoration(labelText: 'Marks'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> marks = {
                      'student_id': _studentIdController.text,
                      'course_id': _courseIdController.text,
                      'marks': int.parse(_marksController.text),
                    };
                    DatabaseHelper().insertMarks(marks);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Marks added successfully')),
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
