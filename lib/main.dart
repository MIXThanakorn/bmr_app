import 'package:bmr_app/home_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmrApp());
}

class BmrApp extends StatefulWidget {
  const BmrApp({super.key});

  @override
  State<BmrApp> createState() => _BmrAppState();
}

class _BmrAppState extends State<BmrApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUi(),
    );
  }
}
