import 'package:final193238/widgets/circular_image_slider.dart';
import 'package:final193238/widgets/img_grid.dart';
import 'package:final193238/widgets/img_slider.dart';
import 'package:final193238/widgets/navigation_drawer_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';
class InsideView extends StatefulWidget {
  const InsideView({Key? key}) : super(key: key);

  @override
  State<InsideView> createState() => _InsideView();
}

class _InsideView extends State<InsideView> {
  List<String> sliderImages = [
    "https://entornosaludable.com/wp-content/uploads/2019/09/papelmatic-higiene-profesional-limpieza-desinfeccion-clinicas-veterinarias-980x617.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOOYySFd7nkev-oht4fDDV1H3MeKuiDFHtsg&usqp=CAU",
    "https://vetmarketportal.com.ar/uploads/noticias/5/20200322202535_vet.jpg"
  ];

  static const List<String> firstImages = [
    "https://m.media-amazon.com/images/I/61coKjZfIZL._AC_SX466_.jpg",
    "https://m.media-amazon.com/images/I/81mAiTD4pPL._AC_SX466_.jpg",
    "https://m.media-amazon.com/images/I/71wx2CJZ2hS._AC_SX466_.jpg",
    "https://m.media-amazon.com/images/I/61hd2MvGV0L._AC_SX466_.jpg",
  ];

  static const List<String> secondImages = [
    "https://m.media-amazon.com/images/I/91qHnpkodoL._AC_SY879_.jpg",
    "https://m.media-amazon.com/images/I/61qAlkA1tgL._AC_SX466_.jpg",
    "https://m.media-amazon.com/images/I/614c2nBG-ML._AC_SS450_.jpg",
    "https://m.media-amazon.com/images/I/81gkA4-A0PL._AC_SX466_.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: ColorsViews.txtHeaderColor,

        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ImageSlider(sliderImages),
                  SizedBox(
                    height: 25,
                  ),
                  CircularImageSlider(),
                  SizedBox(
                    height: 25,
                  ),
                  ImageGrid(firstImages),
                  ImageGrid(secondImages),
                ],
              ),
            ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}