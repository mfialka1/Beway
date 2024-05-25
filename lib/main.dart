import 'package:flutter/material.dart';
import 'swap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Nastavenia(),
    );
  }
}

class Nastavenia extends StatefulWidget {
  const Nastavenia({super.key});

  @override
  _NastaveniaState createState() => _NastaveniaState();
}

class _NastaveniaState extends State<Nastavenia> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      backgroundColor: Colors.green,
      body: CustomDoplnok(),
      
    );
  }
}
