import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CardDicountSection extends StatelessWidget {
  CardDicountSection({super.key});
  final List<String> imgList = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: CarouselSlider(
          options: CarouselOptions(
            height: 130,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: [
            ...List.generate(
                imgList.length,
                (index) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(imgList[index]),
                              fit: BoxFit.fill)),
                    ))
          ]),
    );
  }
}
