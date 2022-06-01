import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';

import '../back_view.dart';

class ImageGrid extends StatelessWidget {
  ImageGrid(this.images);
  List<String> images;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Para una sola fila poner en 345 y 500 para 2 filas
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(images.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BackView()));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                surfaceTintColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      images[index],
                      height:
                      200, // Para una sola fila poner en 200 y 115 para 2 filas
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}