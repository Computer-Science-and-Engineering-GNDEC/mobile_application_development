import 'package:flutter/material.dart';

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

class StudentInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            CircleAvatar(
              backgroundImage: AssetImage('assets/priyanshu.jpeg'),
              radius: 80,
            ),
            SizedBox(height: 70),
            Text(
              'Priyanshu sharma',
              style: TextStyle(fontSize: 30,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}