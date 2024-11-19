import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Example'),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //print(constraints.maxWidth);
          // Prüfen, ob die Breite des Bildschirms kleiner oder größer ist
          if (constraints.maxWidth < 600) {
            // Layout für kleinere Bildschirme (z. B. Mobilgeräte)
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Small Screen',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            );
          } else {
            // Layout für größere Bildschirme (z. B. Tablets oder Desktops)
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Large Screen',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.green,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
