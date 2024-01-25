import 'package:flutter/material.dart';
import 'package:mobiledevelopment/display.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              child: Text('profile button'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  )),
        ],
      )),
    );
  }
}
