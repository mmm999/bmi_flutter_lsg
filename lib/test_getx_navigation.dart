import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // GetMaterialApp ersetzt MaterialApp

      home: FirstScreen(), // Startbildschirm der App
    );
  }
}

class FirstScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Erster Bildschirm')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Gib deinen Namen ein',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  // Navigation mit GetX und Übergabe des Namens
                  Get.to(() => const SecondScreen(),
                      arguments: _nameController.text);
                }
              },
              child: const Text('Weiter'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Abrufen des übergebenen Namens mit Get.arguments
    final String name = Get.arguments ?? 'Unbekannt';

    return Scaffold(
      appBar: AppBar(title: const Text('Zweiter Bildschirm')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hallo, $name!',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Zurück zur vorherigen Seite mit GetX
              },
              child: const Text('Zurück'),
            ),
          ],
        ),
      ),
    );
  }
}
