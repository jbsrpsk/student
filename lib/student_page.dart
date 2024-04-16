import 'package:student/database_helper.dart'; // Import the database helper class
import 'package:flutter/material.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getAllStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is loading
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If an error occurs
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If data is successfully fetched
            List<Map<String, dynamic>> students = snapshot.data ?? [];
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${students[index]['first_name']} ${students[index]['last_name']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('ID: ${students[index]['student_id']}'),
                      Text('Fees Paid: ${students[index]['fees_paid'] == 1 ? 'Yes' : 'No'}'),
                    ],
                  ),
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
