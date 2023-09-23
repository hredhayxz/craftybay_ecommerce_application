import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({super.key});

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 320.0,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey.shade400),
                    alignment: Alignment.center,
                    child: Text(
                      'image $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> dottedList = [];
            for (int i = 0; i < 5; i++) {
              dottedList.add(Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.primaryColor : Colors.white),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: dottedList,
            );
          },
        )
      ],
    );
  }
}
