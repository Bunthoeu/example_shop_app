part of 'search_bloc.dart';

@immutable
abstract class ProductsSerchState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsSerchState {}

class ProductsLoadingState extends ProductsSerchState {}

class ProductsLoadedState extends ProductsSerchState {
  final List<Products> products;
   ProductsLoadedState({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsSerchState { final String error;
   ProductsErrorState({required this.error});
  @override
  List<Object> get props => [error];}
