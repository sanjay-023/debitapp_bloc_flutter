import 'package:debitapp_bloc/presentation/screens/home/widgets/carousel_slider.dart';
import 'package:debitapp_bloc/presentation/screens/home/widgets/overlay.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double? expandedHeight;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 60;
    final top = expandedHeight! - shrinkOffset - size / 2;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildCarousel(shrinkOffset),
        Positioned(
          top: top + 3,
          left: 20,
          right: 20,
          child: buildOverlay(shrinkOffset),
        ),
      ],
    );
  }

  Widget buildCarousel(double shrinkOffset) =>
      Opacity(opacity: disappear(shrinkOffset), child: const CarouselWidget());
  Widget buildOverlay(double shrinkOffset) => Container(
        child: Row(children: const [
          OverlayWidget(iconUrl: "asset/images/plus.png", hText: "NEW"),
          OverlayWidget(
              iconUrl: "asset/images/topright-arrow.png", hText: "PAY OFF"),
          OverlayWidget(
            iconUrl: "asset/images/bottomleft_arrow.png",
            hText: "LEND",
          ),
          OverlayWidget(iconUrl: "asset/images/grid.png", hText: "MORE")
        ]),
      );

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight!;
  double disappear(double shrinkOffset) =>
      1 - shrinkOffset / expandedHeight! - 0.1;

  @override
  double get maxExtent => expandedHeight!;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
