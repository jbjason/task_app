import 'dart:convert';
import 'dart:io';
import 'package:task_app/model/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProductsAPI() async {
  final url = Uri.parse(
      "https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test");

  final List<Product> fetchList = [];
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      (extractedData['data'] as List).map((json) {
        fetchList.add(Product.fromJson(json));
      }).toList();
    } else {
      throw const HttpException('Error Occurs while Loading');
    }
  } catch (e) {
    throw HttpException(e.toString());
  }
  return fetchList;
}
