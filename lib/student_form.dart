import 'package:flutter/material.dart';
import 'database_helper.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _studentIdController = TextEditingController();
  bool _feesPaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(labelText: 'Student ID'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter student ID';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: Text('Fees Paid'),
                value: _feesPaid,
                onChanged: (value) {
                  setState(() {
                    _feesPaid = value ?? false;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    Map<String, dynamic> student = {
                      'first_name': _firstNameController.text,
                      'last_name': _lastNameController.text,
                      'student_id': _studentIdController.text,
                      'fees_paid': _feesPaid ? 1 : 0,
                    };
                    int id = await DatabaseHelper().insertStudent(student);
                    if (id != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Student saved with ID: $id')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to save student')),
                      );
                    }
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
