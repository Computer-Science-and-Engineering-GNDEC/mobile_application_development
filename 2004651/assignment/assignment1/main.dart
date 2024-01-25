
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(StudentInfoApp());
}

class StudentInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentInfoScreen(),
    );
  }
}

class StudentInfoScreen extends StatefulWidget {
  @override
  _StudentInfoScreenState createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  // Variable to store the selected image
  String imagePath = 'assets/ritu.jpeg';

  // Function to handle image picking
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            // Wrap CircleAvatar with InkWell to make it clickable
            InkWell(
              onTap: () {
                // Open image picker on icon click
                _pickImage();
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/ritu.jpeg'),
                    radius: 80,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Open image picker on icon click
                        _pickImage();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            Text(
              'Ritu',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
