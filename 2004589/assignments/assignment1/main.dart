import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AScreen Lock',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          // color: Colors.black
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9
                ],
                // colors: [
                //   Colors.yellow,
                //   Colors.red,
                //   Colors.indigo,
                //   Colors.teal,
                // ]
                colors: [
                  Colors.black,
                  Colors.black87,
                  Colors.black87,
                  Colors.black,
                ]
            )
        ),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 119,),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/img1.png'),
                backgroundColor: Colors.transparent,
                radius: 100,
              ),
              SizedBox(height: 49,),
              Text('Inderjeet Singh', style: TextStyle(fontSize: 29, color: Colors.white),)
            ]
        ),

      ),
    );
  }
}
