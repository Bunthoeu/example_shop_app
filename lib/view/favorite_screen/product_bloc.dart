// import 'dart:async';

// import 'package:product_shop_api/api_repository/api_repository.dart';
// import 'package:product_shop_api/model/product_model.dart';

// class ProductBloc {
//   final ApiRepository _repository = ApiRepository();

//   final _productsController = StreamController<List<Products>>();
//   Stream<List<Products>> get products => _productsController.stream;

//   final _favoritesController = StreamController<List<Products>>();
//   Stream<List<Products>> get favorites => _favoritesController.stream;
//   bool _isDisposed = false;
//   void dispose() {
//     //_productsController.close();
//    // _favoritesController.close();
//     _isDisposed = true;
//   }

//   Future<void> fetchProducts() async {
//      if(_isDisposed) {
//       return;
//     }
//     final products = await _repository.getProduct();
//     _productsController.sink.add(products);
//   }

//   Future<void> toggleFavorite(int productId) async {
//      if(_isDisposed) {
//       return;
//     }
//     await _repository.toggleFavorite(productId);
//     fetchFavorites();
//   }

//   Future<void> fetchFavorites() async {
//      if(_isDisposed) {
//       return;
//     }
//     final favorites = await _repository.getFavorite();
//     _favoritesController.sink.add(favorites);
//   }
// }

// ProductBloc productBloc = new ProductBloc();
