import 'package:flutter/material.dart';
import 'package:task_app/model/product.dart';
import 'package:task_app/providers/api_call.dart';

class Products extends ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '1',
      caption: 'Entertainment',
      videoUrl: "https://source.unsplash.com/random?sig=${1}",
      date: DateTime.now(),
    ),
    Product(
      id: '2',
      caption: 'Entertainment2',
      videoUrl: "https://source.unsplash.com/random?sig=${2}",
      date: DateTime.now().subtract(const Duration(hours: 4)),
    ),
  ];

  List<Product> get items => [..._items];

  Future<void> fetchProducts() async {
    final fetchList = await fetchProductsAPI();
    if (fetchList.isNotEmpty) {
      fetchList.map((pro) => _items.add(pro)).toList();
    }
  }
}
