import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/products.dart';
import 'package:task_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
