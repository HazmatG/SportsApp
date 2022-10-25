import 'package:flutter/material.dart';
import 'package:untitled/pages/LogInPage.dart';

void main() {
  runApp(SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LogInPage(),
      ),
    );
  }
}
