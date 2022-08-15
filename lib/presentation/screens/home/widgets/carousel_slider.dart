import 'package:carousel_slider/carousel_slider.dart';
import 'package:debitapp_bloc/presentation/screens/home/widgets/card_widget.dart';
import 'package:debitapp_bloc/presentation/screens/home/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: CarouselSlider(
          items: [
            CardWidget(
              cardColor: CustomColors().firstCard,
              amountText: "1250",
              iconUrl: "asset/images/bottom_left_arrow.png",
              title: "Owe me",
            ),
            CardWidget(
              cardColor: CustomColors().secondCard,
              amountText: "1130",
              iconUrl: "asset/images/top_right_arrow.png",
              title: "I owe",
            ),
            CardWidget(
              cardColor: CustomColors().firstCard,
              amountText: "2930",
              iconUrl: "asset/images/bottom_left_arrow.png",
              title: "I owe",
            ),
            CardWidget(
              cardColor: CustomColors().secondCard,
              amountText: "2930",
              iconUrl: "asset/images/top_right_arrow.png",
              title: "I owe",
            )
          ],
          options: CarouselOptions(
              enableInfiniteScroll: false,
              padEnds: false,
              initialPage: 0,
              height: 220.h,
              disableCenter: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.42,
              autoPlay: false)),
    );
  }
}
