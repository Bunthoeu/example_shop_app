import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop_api/api_repository/api_repository.dart';
import 'package:product_shop_api/register_screen/register_screen.dart';
import 'package:product_shop_api/theme/color.dart';
import 'package:product_shop_api/view/favorite_screen/favorite_bloc.dart';
import 'package:product_shop_api/view/home_screen/cart_screen/cart_screen.dart';
import 'package:product_shop_api/view/home_screen/search_section/search_screen.dart';
import 'package:badges/badges.dart' as badges;

class SearchSection extends StatefulWidget {
  const SearchSection({
    super.key,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  final string = 'Hello';
  FavoriteBloc? _bloc;
  final int counter = 0;
  @override
  void initState() {
    _bloc = FavoriteBloc(apiRepository: ApiRepository())..add(FetchFavorites());

    super.initState();
    counter;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, left: 16, bottom: 16),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(right: 8),
              child: TextField(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  FocusScope.of(context).unfocus();
                  TextEditingController().clear();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(
                                text: string,
                              )));
                },
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 17),
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
          Expanded(
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(
                end: 15,
              ),
              badgeContent: BlocBuilder<FavoriteBloc, FavoriteState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    state.products.length;

                    return Text(
                      state.products.length.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    );
                  }
                  return Text('0');
                },
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColor,
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: Expanded(
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(
                  end: 15,
                ),
                badgeContent: Text(
                  '3',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColor,
                  ),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
