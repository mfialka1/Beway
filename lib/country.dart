import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Krajiny'),
      ),
      body: const Center(
        child: Text('Obsah stránky s krajinami'),
      ),
    );
  }
}