part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}
class FetchProducts extends FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final Products product;

  ToggleFavorite({required this.product});
}

class FetchFavorites extends FavoriteEvent {}