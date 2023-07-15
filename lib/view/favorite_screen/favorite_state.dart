part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class ProductLoading extends FavoriteState {}

class ProductLoaded extends FavoriteState {
  final List<Products> products;

  ProductLoaded({required this.products});
}

class FavoritesLoaded extends FavoriteState {
  final List<Products> favorites;

  FavoritesLoaded({required this.favorites});
}