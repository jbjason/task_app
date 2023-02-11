import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/widgets/h_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            // appBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appBarIcon(CupertinoIcons.camera_fill),
                const Text(
                  'EXPLORE',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                _appBarIcon(Icons.notifications_on),
              ],
            ),
            const SizedBox(height: 5),
            // productsList
            const Expanded(child: HBody()),
          ],
        ),
      ),
    );
  }

  Widget _appBarIcon(IconData icon) => Container(
        width: 44,
        height: 44,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE6EEFA),
        ),
        child: Icon(icon, color: Colors.black),
      );
}
