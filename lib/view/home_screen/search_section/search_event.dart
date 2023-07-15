part of 'search_bloc.dart';

@immutable
abstract class ProductsSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchEvent extends ProductsSearchEvent {
  final String query;
  SearchEvent({required this.query});

  @override
  List<Object> get props => [query];
}
