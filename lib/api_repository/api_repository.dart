
import 'package:product_shop_api/api/api_provider.dart';
import 'package:product_shop_api/model/product_model.dart';
class ApiRepository {
  ApiRepository();

  final ApiProvider _apiProvider = ApiProvider();
  Future<List<Products>> getProduct() {
    return _apiProvider.getProduct();
  }

  Future<List<Products>> getSearchProduct(String query) {
    return _apiProvider.searchProduct(query);
  }

  Future<List<Products>> searchProduct(String query) {
    return _apiProvider.search(query);
  }

  Future<List<Products>> getFavorite() {
    return _apiProvider.fetchFavorites();
  }

  Future<void> toggleFavorite(Products prodId) {
    return _apiProvider.toggleFavorite(prodId);
  }
}
