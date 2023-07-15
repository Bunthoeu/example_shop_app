import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';

import '../../../model/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchProductBloc extends Bloc<ProductsSearchEvent, ProductsSerchState> {
  final ApiRepository apiRepository;
  SearchProductBloc({required this.apiRepository}) : super(ProductsInitial()) {
    on<ProductsSearchEvent>((event, emit) async {
      try {
        if (event is SearchEvent) {
          emit(ProductsLoadingState());
          final products =
              await apiRepository.searchProduct(event.query);
          emit(ProductsLoadedState(products: products));
        }
      } catch (e) {
      
      }
    });
  }
}
