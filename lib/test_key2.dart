import 'package:flutter/material.dart';

void main() => runApp(BasicKeyPage());

class BasicKeyPage extends StatefulWidget {
  const BasicKeyPage({super.key});

  @override
  _BasicKeyPageState createState() => _BasicKeyPageState();
}

class _BasicKeyPageState extends State<BasicKeyPage> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Test Key"),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showEmail)
                  const TextField(
                    key: ValueKey(1),
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                const TextField(
                  key: ValueKey(2),
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            icon: const Icon(Icons.visibility_off),
            label: const Text('Remove Email'),
            onPressed: () => setState(() => showEmail = false),
          ),
        ),
      );
}
