import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS students(id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'first_name TEXT, last_name TEXT, student_id TEXT, fees_paid INTEGER)',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS courses(id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'course_id TEXT, course_name TEXT, course_description TEXT)',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS marks(id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'student_id TEXT, course_id TEXT, marks INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    final db = await database;
    return db.insert('students', student);
  }

  Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await database;
    return db.query('students');
  }

  Future<int> insertCourse(Map<String, dynamic> course) async {
    final db = await database;
    return db.insert('courses', course);
  }

  Future<List<Map<String, dynamic>>> getAllCourses() async {
    final db = await database;
    return db.query('courses');
  }

  Future<int> insertMarks(Map<String, dynamic> marks) async {
    final db = await database;
    return db.insert('marks', marks);
  }

  Future<List<Map<String, dynamic>>> getMarksByStudentId(String studentId) async {
    final db = await database;
    return db.query('marks', where: 'student_id = ?', whereArgs: [studentId]);
  }
}
