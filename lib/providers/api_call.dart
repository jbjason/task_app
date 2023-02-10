import 'dart:convert';
import 'package:task_app/model/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProductsAPI() async {
  final url = Uri.parse(
      "https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test");
  final List<Product> fetchList = [];
  try {
    final response = await http.get(url);
    final data = json.decode(response.body);
    if (data != null) {
      final extractedData = data as Map<String, dynamic>;
      extractedData.forEach((proId, prodData) {
        // _fetchList.add(Product(
        //   id: proId,
        //   title: prodData['title'],
        //   subtitle: prodData['subtitle'],
        //   description: prodData['description'],
        //   price: prodData['price'],
        //   category: prodData['category'],
        //   imageUrl: (prodData['imageUrl'] as List<dynamic>)
        //       .map((e) => e['imageUrl1'].toString())
        //       .toList(),
        //   size: (prodData['size'] as List<dynamic>)
        //       .map((e) => e['size1'].toString())
        //       .toList(),
        //   color: (prodData['color'] as List<dynamic>)
        //       .map((e) => Color(int.parse(e['color1'])))
        //       .toList(),
        // ));
      });
    }
    return fetchList;
  } catch (e) {
    print('fetch prb $e');
    return fetchList;
  }
}
