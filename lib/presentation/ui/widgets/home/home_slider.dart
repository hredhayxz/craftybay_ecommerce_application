import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({super.key, required this.sliders});

  final List<SliderData> sliders;

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeFactor: 0.2,
              viewportFraction: 1,
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            sliderData.title ?? '',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Stack(
                          children: [
                            Image.network(
                              sliderData.image ?? '',
                              fit: BoxFit.fitHeight,
                              height: 90,
                            ),
                            Positioned(
                              left: 35,
                              top: 10,
                              child: SizedBox(
                                height: 70,
                                child: Image.asset(
                                  'assets/images/hot_selling.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            sliderData.price ?? '',
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primaryColor,
                              ),
                              child: const Text(
                                'Buy Now',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {}),
                        ),
                      )
                    ],
                  ),
                );
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
            for (int i = 0; i < sliders.length; i++) {
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
