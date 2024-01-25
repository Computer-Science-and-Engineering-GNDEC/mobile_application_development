// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(StudentIntroApp());
// }
//
// class StudentIntroApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: StudentIntroScreen(),
//     );
//   }
// }
//
// class StudentIntroScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Intro'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Student Name: Ritu kumari',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'CRN : 2015115',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             // Image.network(
//             //   'https://example.com/student_image.jpg', // Replace with the actual image URL
//             //   width: 150,
//             //   height: 150,
//             //   fit: BoxFit.cover,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// void main() {
//   runApp(StudentInfoApp());
// }
//
// class StudentInfoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: StudentInfoScreen(),
//     );
//   }
// }
//
// class StudentInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       // appBar: AppBar(
//       //   title: Text(''),
//       // ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 200,),
//             CircleAvatar(
//               backgroundImage: AssetImage('assets/ritu.jpeg'),
//               radius: 80,
//             ),
//             SizedBox(height: 70),
//             Text(
//               'Ritu',
//               style: TextStyle(fontSize: 30,color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
