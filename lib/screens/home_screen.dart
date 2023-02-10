import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/products.dart';
import 'package:task_app/widgets/h_product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Products>(context).items;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // appBar
            AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: _appBarIcon(CupertinoIcons.camera_fill),
              centerTitle: true,
              title: const Text(
                'JB Jason',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              actions: [_appBarIcon(Icons.notifications_on)],
            ),
            const SizedBox(height: 5),
            // productsList
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) => HProductItem(product: items[i]),
              ),
            ),
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
