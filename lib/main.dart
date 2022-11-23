import 'package:flutter/material.dart';
import 'package:cittel/home_page.dart';

void main() {
  runApp(const CittelApp());
}

class CittelApp extends StatelessWidget {
  const CittelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CITTEL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
