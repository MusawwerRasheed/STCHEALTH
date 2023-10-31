import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stc_health/Domain/Models/product_model.dart';
 
  

class ProductRepository {
  final http.Client httpClient;
  ProductRepository({required this.httpClient});
  Future<List<Product>> fetchProducts() async {
    final Uri url = Uri.parse('https://fakestoreapi.com/products');
    final response = await httpClient.get(url);
     if (response.statusCode == 200) {
      print('successfully got products'); 
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
