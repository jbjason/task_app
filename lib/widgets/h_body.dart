import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/products.dart';
import 'package:task_app/widgets/h_product_item.dart';

class HBody extends StatelessWidget {
  const HBody({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    return FutureBuilder(
      future: data.fetchProducts(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapShot.error != null) {
            return const Center(child: Text('An error occured'));
          } else {
            final items = data.items;
            return ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) => HProductItem(product: items[i]),
            );
          }
        }
      },
    );
  }
}
