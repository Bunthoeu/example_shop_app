part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Products> products;
   ProductsLoadedState({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState { final String error;
   ProductsErrorState({required this.error});
  @override
  List<Object> get props => [error];}
