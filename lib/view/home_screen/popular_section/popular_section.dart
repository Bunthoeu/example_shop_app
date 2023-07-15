import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';
import 'package:product_shop_api/products_bloc.dart';
import 'package:product_shop_api/theme/color.dart';
import 'package:product_shop_api/view/detail_screen/detaill_screen_products.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({super.key});

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
  ProductsBloc? bloc;
  @override
  void initState() {
    bloc = ProductsBloc(apiRepository: ApiRepository())
      ..add(GetProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc!.close();    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 18, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Product',
                  style: TextStyle(
                      color: AppColors.blueColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See More',
                  style: TextStyle(
                      color: AppColors.redColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ),
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsLoadedState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(state.products.length, (index) {
                        final products = state.products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contexte) => DetailScreenProduct(
                                          products: products,
                                        )));
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16, bottom: 12, top: 8),
                                padding: EdgeInsets.all(8),
                                height: 150,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            products.image.toString()))),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  products.title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  '\$ ${products.price}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: 100),
                );
              }
              return Center(
                child: Text('No Data'),
              );
            },
          )
        ],
      ),
    );
  }
}
