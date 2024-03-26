import 'package:flutter/material.dart';
import 'package:ju_unpa_app/pages/home_page.dart';

void main() {
  runApp(const ju_unpa_app());
}

class ju_unpa_app extends StatelessWidget {
  const ju_unpa_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen),
    );
  }
}
