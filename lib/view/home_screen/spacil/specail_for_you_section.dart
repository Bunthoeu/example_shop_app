import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';
import 'package:product_shop_api/products_bloc.dart';
import 'package:product_shop_api/theme/color.dart';

class SpecailSection extends StatefulWidget {
  const SpecailSection({super.key});

  @override
  State<SpecailSection> createState() => _SpecailSectionState();
}

class _SpecailSectionState extends State<SpecailSection> {
  final _bloc = ProductsBloc(apiRepository: ApiRepository());
  bool _dataLoaded = false;

  @override
  void initState() {
    _bloc..add(GetProductsEvent());

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
  
    super.dispose();
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
                  'Specail for you',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.bold,
                  ),
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
            bloc: _bloc,
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!_dataLoaded) {
                if (state is ProductsLoadedState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(state.products.length, (index) {
                          final products = state.products[index];
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16, bottom: 12, top: 8),
                                padding: EdgeInsets.all(8),
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.7,
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
                              Positioned(
                                left: 40,
                                top: 40,
                                child: SizedBox(
                                    width: 200,
                                    child: Text(products.title.toString())),
                              )
                            ],
                          );
                        })
                      ],
                    ),
                  );
                }
              } else if (state is ProductsErrorState) {
                return Center(
                  child: Text('No Data'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            buildWhen: (previousData, newData) {
              // only rebuild if data has changed
              return !_dataLoaded && previousData != newData;
            },
          )
        ],
      ),
    );
  }
}
