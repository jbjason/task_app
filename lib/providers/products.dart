import 'package:flutter/material.dart';
import 'package:task_app/model/product.dart';
import 'package:task_app/providers/api_calls.dart';

class Products extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => [..._items];

  Future<void> fetchProducts() async {
    final fetchList = await fetchProductsAPI();
    if (fetchList.isNotEmpty) {
      fetchList.map((pro) => _items.add(pro)).toList();
    }
  }
}
