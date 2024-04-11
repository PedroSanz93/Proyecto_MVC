import 'dart:convert';
import 'package:proyecto_mvc/src/model/product.dart';
import 'package:proyecto_mvc/src/utils/api_product_utils.dart';

class ProductService {
  final APIProductUtils _apiProductUtils = APIProductUtils();

  Future<List<Product>?> list() async {
    try {
      final response = await _apiProductUtils.get('products');
      if (response != null && response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Error al obtener los productos: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al obtener los productos: $e');
      return null;
    }
  }

  Future<Product?> create(Map<String, dynamic> data) async {
    try {
      final response = await _apiProductUtils.post('products', body: data);
      if (response != null && response.statusCode == 201) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Product.fromJson(jsonData);
      } else {
        print('Error al crear el producto: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al crear el producto: $e');
      return null;
    }
  }

  Future<Product?> read(int id) async {
    try {
      final response = await _apiProductUtils.get('products/$id');
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Product.fromJson(jsonData);
      } else {
        print('Error al obtener el producto: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al obtener el producto: $e');
      return null;
    }
  }

  Future<Product?> update(int id, Map<String, dynamic> data) async {
    try {
      final response = await _apiProductUtils.put('products/$id', body: data);
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Product.fromJson(jsonData);
      } else {
        print('Error al actualizar el producto: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al actualizar el producto: $e');
      return null;
    }
  }

  Future<bool> delete(int id) async {
    try {
      final response = await _apiProductUtils.delete('products/$id');
      if (response != null && response.statusCode == 204) {
        return true;
      } else {
        print('Error al eliminar el producto: ${response?.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error al eliminar el producto: $e');
      return false;
    }
  }
}
