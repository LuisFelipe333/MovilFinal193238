import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';

class CircularImageSlider extends StatelessWidget {
  const CircularImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "data:image/jpeg;base64,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",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://data.whicdn.com/images/351910988/original.jpg",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsVVZWKt0cU7g3uzOYlZcjbFoWd9iEoQr3tA&usqp=CAU",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "data:image/jpeg;base64,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",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWmHKs6QGxmzOxk5wVo6MdyqFCWt5Eldxnqyh95sljVtTW8qEiO1j3FNmq9KvTsS8hIAo&usqp=CAU",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "data:image/jpeg;base64,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",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://i0.wp.com/www.followchain.org/wp-content/uploads/2021/09/best-discord-profile-pictures-11.png?resize=256%2C256&ssl=1",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  "https://a.wattpad.com/useravatar/_kyuxz.256.854920.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        height: 100,
        width: 100,
        center: Offset(size.width / 2, size.height / 2));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}