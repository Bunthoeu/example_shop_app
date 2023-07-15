import 'dart:convert';

import 'package:product_shop_api/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiProvider {
  ApiProvider();
  final apiUrl = 'https://fakestoreapi.com/';
  Future<List<Products>> getProduct() async {
    final response = await http.get(Uri.parse('${apiUrl}products'));

    final List<dynamic> dataProducts = jsonDecode(response.body);
    return dataProducts.map((e) => Products.fromJson(e)).toList();
  }

  Future<List<Products>> searchProduct(String query) async {
    final response = await http.get(Uri.parse('${apiUrl}products?q=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final products = data.map((json) => Products.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to search products');
    }
  }

  Future<List<Products>> search(String query) async {
    final baseUrl = 'https://fakestoreapi.com';
    final response = await http.get(Uri.parse('$baseUrl/products?q=$query'));
    final List<dynamic> json = jsonDecode(response.body);
    //final results = json['results'] as List<dynamic>;
    return json.map((result) => Products.fromJson(result)).toList();
  }
  // Future<void> toggleFavorite(int productId) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final favorites = prefs.getStringList('favorites') ?? [];

  //   if (favorites.contains(productId.toString())) {
  //     favorites.remove(productId.toString());
  //   } else {
  //     favorites.add(productId.toString());
  //   }

  //   await prefs.setStringList('favorites', favorites);
  // }

  // Future<List<Products>> getFavorites() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final favorites = prefs.getStringList('favorites') ?? [];

  //   final products = await getProduct();
  //   return products.where((product) => favorites.contains(product.id.toString())).toList();
  // }
  Future<void> toggleFavorite(Products product) async {
    product.isFavorite = product.isFavorite;
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    final favorites = favoritesJson
        .map((favoriteJson) => Products.fromJson(jsonDecode(favoriteJson)))
        .toList();
    if (product.isFavorite) {
      favorites.add(product);
    } else {
      favorites.removeWhere((favorite) => favorite.id == product.id);
    }
    final favoritesJsonUpdated =
        favorites.map((favorite) => jsonEncode(favorite.toJson())).toList();
    prefs.setStringList('favorites', favoritesJsonUpdated);
  }

  Future<List<Products>> fetchFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    final favorites = favoritesJson
        .map((favoriteJson) => Products.fromJson(jsonDecode(favoriteJson)))
        .toList();
    return favorites;
  }
}
