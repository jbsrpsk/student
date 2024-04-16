import 'package:flutter/material.dart';
import 'package:student/database_helper.dart'; // Import the database helper class

class ViewMarksPage extends StatefulWidget {
  @override
  _ViewMarksPageState createState() => _ViewMarksPageState();
}

class _ViewMarksPageState extends State<ViewMarksPage> {
  final TextEditingController _studentIdController = TextEditingController();
  List<Map<String, dynamic>> _marksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Marks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _studentIdController,
              decoration: InputDecoration(labelText: 'Enter Student ID'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _fetchMarks();
              },
              child: Text('Fetch Marks'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _marksList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Course ID: ${_marksList[index]['course_id']}'),
                    subtitle: Text('Marks: ${_marksList[index]['marks']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchMarks() async {
    List<Map<String, dynamic>> marks = await DatabaseHelper().getMarksByStudentId(_studentIdController.text);
    setState(() {
      _marksList = marks;
    });
  }
}
