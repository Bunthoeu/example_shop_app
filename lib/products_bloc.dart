import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';
import 'model/product_model.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiRepository apiRepository;
  ProductsBloc({required this.apiRepository}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(ProductsLoadingState());
        final products = await apiRepository.getProduct();
        emit(ProductsLoadedState(products: products));
      }
    });
  }
}
