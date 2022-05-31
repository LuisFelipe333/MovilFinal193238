import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider(this.images);
  List<String> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  int pagePosition = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
          child: PageView.builder(
              itemCount: widget.images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  pagePosition = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Image.network(widget.images[pagePosition]),
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(widget.images.length, pagePosition),
        )
      ],
    );
  }
}

List<Widget> indicators(imagesLenght, currentIndex) {
  return List<Widget>.generate(imagesLenght, (index) {
    return Container(
      margin: EdgeInsets.all(2),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? ColorsViews.activeSliderColor
              : ColorsViews.disableSliderColor,
          shape: BoxShape.circle),
    );
  });
}
