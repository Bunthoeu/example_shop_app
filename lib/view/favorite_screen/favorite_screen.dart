import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';
import 'package:product_shop_api/main_screen.dart';
import 'package:product_shop_api/theme/color.dart';
import 'package:product_shop_api/view/favorite_screen/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteBloc? _bloc;
  @override
  void initState() {
    _bloc = FavoriteBloc(apiRepository: ApiRepository());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen())),
              icon: Icon(
                Icons.arrow_back_ios,
              )),
          title: Text('Favorites'),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          bloc: _bloc!..add(FetchFavorites()),
          builder: (context, state) {
            if (state is ProductLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoaded) {
              return GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                childAspectRatio: 0.75,

                // Generate 100 widgets that display their index in the List.
                children: List.generate(state.products.length, (index) {
                  final products = state.products[index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        width: 300,
                        height: 300,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              products.image.toString(),
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              products.title.toString(),
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColors.blueColor),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '\$${products.price}',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 30,
                          right: 30,
                          child: InkWell(
                              onTap: () {
                                _bloc!.add(ToggleFavorite(product: products));
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              )))
                    ],
                  );
                }),
              );
            }
            return Text('data');
          },
        ));
  }
}
