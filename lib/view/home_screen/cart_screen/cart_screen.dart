import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/view/favorite_screen/favorite_bloc.dart';
import '../../../api_repository/api_repository.dart';
import '../../../theme/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  FavoriteBloc? _bloc;
  @override
  void initState() {
    _bloc = FavoriteBloc(apiRepository: ApiRepository());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(top: 16, left: 8, bottom: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueColor,
            ),
            child: IconButton(
                padding: EdgeInsets.only(left: 8),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  TextEditingController().clear();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          centerTitle: true,
          title: BlocBuilder<FavoriteBloc, FavoriteState>(
            bloc: _bloc!..add(FetchFavorites()),
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      "Cart Screen",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    if (state is ProductLoaded)
                      Text(state.products.length.toString(),
                          style: TextStyle(
                            color: AppColors.redColor,
                            fontSize: 14,
                          )),
                  ],
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            bloc: _bloc!..add(FetchFavorites()),
            builder: (context, state) {
              if (state is ProductLoading) {
                Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                if (state.products.isEmpty) {
                  return Center(
                    child: Text('No Item'),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 32,
                      bottom: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wano Store',
                          style: TextStyle(fontSize: 25),
                        ),
                        ...List.generate(state.products.length, (index) {
                          final products = state.products[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        margin: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                        ),
                                        height: 200,
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(12),
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.gryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      16,
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/icons/invoice.png',
                                                    width: 20,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('Add vocher code'),
                                                Icon(Icons.arrow_forward_ios)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text('Total'),
                                                    Text(
                                                      products.total.toString(),
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 20),
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                AppColors
                                                                    .blueColor,
                                                              ),
                                                              shape: MaterialStateProperty.all<
                                                                      RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ))),
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Add to Cart',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 16),
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  products.image.toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          margin: EdgeInsets.only(left: 8),
                                          height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                products.title.toString(),
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.blueColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Text(
                                                '\$${products.price}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 17),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 90,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: AppColors.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 18,
                                                  ),
                                                ),
                                                Text(
                                                  products.qunity.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 18,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  );
                }
              }
              return Center(
                child: Text(''),
              );
            },
          ),
        ));
  }
}
