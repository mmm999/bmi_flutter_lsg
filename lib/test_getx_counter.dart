import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class CounterController extends GetxController {
  var count = 0.obs; // (observable)

  void increment() => count++;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  final CounterController cc = Get.put(CounterController());

  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
              '${cc.count}',
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cc.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
