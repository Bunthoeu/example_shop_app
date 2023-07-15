import 'package:flutter/material.dart';

import 'package:product_shop_api/theme/color.dart';

import '../../../model/categories_model.dart';

class CategoriesSection extends StatefulWidget {
  CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final categories = Categories.generatlist();
  int isSeleted = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(categories.length, (index) {
            final categorie = categories[index];
            final textColor =
                index == isSeleted ? AppColors.redColor : Colors.grey;
            final iconColor = index == isSeleted ? Colors.white : Colors.grey;
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSeleted = index;
                });
                print(index);
              },
              child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 16,
                      ),
                      padding: EdgeInsets.all(12),
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: index == isSeleted
                              ? AppColors.blueColor
                              : Colors.grey[300]),
                      child: Image.asset(
                        categorie.image!,
                        width: 20,
                        color: iconColor,
                      ),
                    ),
                    Text(
                      categorie.name!,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
