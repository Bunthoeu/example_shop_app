part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
   @override
  List<Object> get props => [];
}
class GetProductsEvent extends ProductsEvent{}
