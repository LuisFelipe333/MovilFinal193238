import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';

class BackView extends StatefulWidget {
  const BackView({Key? key}) : super(key: key);

  @override
  State<BackView> createState() => _BackView();
}

class _BackView extends State<BackView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: ColorsViews.txtHeaderColor,
          foregroundColor: ColorsViews.backgroundColor,
        ),
      ),
    );
  }
}