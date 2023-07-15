import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';

import '../../../theme/color.dart';
import 'search_bloc.dart';

class SearchScreen extends StatefulWidget {
  final String text;
  const SearchScreen({super.key, required this.text});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  SearchProductBloc? searchProductBloc;
  @override
  void initState() {
    searchProductBloc = SearchProductBloc(apiRepository: ApiRepository());
    ;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    //focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(top: 16, left: 8, bottom: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainColor,
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
                color: AppColors.blueColor,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 32, right: 16, bottom: 25),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      if (_controller.text == value) {
                        searchProductBloc!.add(SearchEvent(query: value));
                      }
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.gryColor,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      hintStyle:
                          TextStyle(color: AppColors.blueColor, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.blueColor,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor: AppColors.mainColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'What do you want to find?',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<SearchProductBloc, ProductsSerchState>(
        bloc: searchProductBloc,
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoadedState) {
            if (state.products.isEmpty) {
              return Center(child: Text('No API'));
            } else if (_controller.text == '') {
              return Center(child: Text('Your Resulthjd'));
            } else {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final products = state.products[index];
                  return Container(
                    margin: EdgeInsets.only(right: 16, left: 16, top: 16),
                    child: Column(
                      children: [
                        Card(
                          shadowColor: Colors.red,
                          elevation: 8,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.redAccent, Colors.red],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products.title.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  Text(
                                    products.description.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          } else if (_controller.text == '') {
            return Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off_outlined,
                  color: AppColors.blueColor,
                  size: 30,
                ),
                Text('Your Resultg'),
              ],
            ));
          }
          return Center(child: Text('No Data'));
        },
      ),
    );
  }
}
