import 'package:flutter/material.dart';

class About_app_Page extends StatelessWidget {
  const About_app_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('o apke'),
      ),
      body: const Center(
        child: Text('Obsah stránky s krajinami'),
      ),
    );
  }
}