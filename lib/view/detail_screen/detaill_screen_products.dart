import 'package:flutter/material.dart';

import 'package:product_shop_api/api_repository/api_repository.dart';
import 'package:product_shop_api/model/product_model.dart';
import 'package:product_shop_api/theme/color.dart';
import 'package:product_shop_api/view/favorite_screen/favorite_bloc.dart';

class DetailScreenProduct extends StatefulWidget {
  final Products products;
  const DetailScreenProduct({super.key, required this.products});

  @override
  State<DetailScreenProduct> createState() => _DetailScreenProductState();
}

class _DetailScreenProductState extends State<DetailScreenProduct> {
  final _bloc = FavoriteBloc(apiRepository: ApiRepository());

  @override
  void initState() {
    //  _bloc = FavoriteBloc(apiRepository: ApiRepository());
    super.initState();
    _updateCart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateCart() {
    widget.products.total = widget.products.price * widget.products.qunity;
  }

  void _incrementCartItemQuantity() async {
    setState(() {
      widget.products.qunity++;
      _updateCart();
    });
  }

  void _dicrementCartItemQuantity() async {
    setState(() {
      if (widget.products.qunity == 0) {
        return null;
      } else {
        widget.products.qunity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.network(
                      widget.products.image.toString(),
                      width: 200,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 16),
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.products.title.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            widget.products.description.toString(),
                            overflow: TextOverflow.ellipsis,
                            // textAlign: TextAlign.center,
                            maxLines: 4, style: TextStyle(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'See More Detail >',
                          style: TextStyle(
                              fontSize: 17,
                              //  fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                height: 40,
              ),
            ),
            appBar(),
            Positioned(
              bottom: 290,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  height: 40,
                  width: 70,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _bloc.add(ToggleFavorite(product: widget.products));
                        widget.products.isFavorite =
                            !widget.products.isFavorite;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color:
                          widget.products.isFavorite ? Colors.red : Colors.grey,
                    ),
                  )),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 163, 134, 162),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.sp,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 16,
                            top: 18,
                          ),
                          child: Text(
                            'Total :',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 16,
                            top: 8,
                          ),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            '\$${widget.products.total}',
                            style: TextStyle(color: Colors.amber, fontSize: 20),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 16, top: 16),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _incrementCartItemQuantity();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: 80, right: 8, left: 16),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                                Text(
                                  widget.products.qunity.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                InkWell(
                                  onTap: () {
                                    _dicrementCartItemQuantity();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: 80, right: 8, left: 16),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.redColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          _bloc.add(ToggleFavorite(product: widget.products));
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Align(
              alignment: Alignment(0.8, 0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
            ),
          ),
        ),
        Container(
          height: 25,
          width: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
          ),
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(widget.products.rating.rate.toString()),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
