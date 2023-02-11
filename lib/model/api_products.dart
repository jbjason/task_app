import 'dart:convert';
import 'package:task_app/model/product.dart';
import 'package:http/http.dart' as http;

ProductsApi productsapiFromJson(http.Response str) {
  return ProductsApi.fromJson(json.decode(str.body));
}

String productsapiToJson(ProductsApi data) => json.encode(data.toJson());

class ProductsApi {
  ProductsApi({required this.success, required this.data});
  bool success;
  List<Product> data;

  factory ProductsApi.fromJson(Map<String, dynamic> json) => ProductsApi(
        success: json["success"],
        data: List<Product>.from(
          json["data"].map((x) => Product.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
