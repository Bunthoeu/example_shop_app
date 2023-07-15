import 'package:flutter/material.dart';
import 'package:product_shop_api/view/home_screen/card_dicount_section/card_dicount_section.dart';
import 'package:product_shop_api/view/home_screen/categories_section/categories_section.dart';
import 'package:product_shop_api/view/home_screen/search_section/searc_textfield.dart';
import 'package:product_shop_api/view/home_screen/spacil/specail_for_you_section.dart';

import 'popular_section/popular_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchSection(),
            CardDicountSection(),
            CategoriesSection(),
            SpecailSection(),
            PopularSection(),
          ],
        ),
      ),
    );
  }
}
