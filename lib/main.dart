import 'package:flutter/material.dart';
import 'package:scratchandwin/Part1.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text('Scratch and Win',style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic
        ),),
        backgroundColor: Colors.blue.shade900,
        ),
        backgroundColor: Colors.blueAccent.shade100,
        body: new Part1(),
      ),
    );
      
  }
}
