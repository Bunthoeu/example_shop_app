import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';
import '../../model/product_model.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ApiRepository apiRepository;
  FavoriteBloc({required this.apiRepository}) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is FetchFavorites) {
        emit(ProductLoading());
        try {
          final products = await apiRepository.getFavorite();
          emit(ProductLoaded(products: products));
        } catch (e) {
          emit(FavoriteInitial());
        }
      } else if (event is ToggleFavorite) {
        await apiRepository.toggleFavorite(event.product);
        final favorites = await apiRepository.getFavorite();
        emit(ProductLoaded(products: favorites));
      } else if (event is FetchFavorites) {
        final favorites = await apiRepository.getFavorite();
         emit(ProductLoaded(products: favorites));

      }
    });
  }
}
