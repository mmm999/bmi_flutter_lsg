import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("data", textAlign: TextAlign.left),
              Text("dataasafsafsf2"),
              Text("dataasfs2"),
              Text("dat"),
            ],
          ),
        ),
      ),
    );
  }
}
