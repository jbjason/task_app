import 'dart:io';
import 'package:task_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/model/api_products.dart';

Future<List<Product>> fetchProductsAPI() async {
  final url = Uri.parse(
      "https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test");

  List<Product> fetchList = [];
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final extractedData = productsapiFromJson(response);
      fetchList = [...extractedData.data];
    } else {
      throw const HttpException('Error Occurs while Loading');
    }
  } catch (e) {
    throw HttpException(e.toString());
  }
  return fetchList;
}
