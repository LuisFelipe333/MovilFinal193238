import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:mvp_all_9/pages/login/main_login.dart';
import 'package:final193238/Login/Login_Content.dart';
import 'package:final193238/pages/store/widgets/named_icon.dart';
import 'package:final193238/style/colors/colors_views.dart';

import '../../../Login/Login.dart';
import '../../../style/colors/colors_views.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorsViews.txtHeaderColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: ColorsViews.activeSliderColor, onPressed: () {
        FirebaseAuth.instance.signOut().then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Login()),
          );
        });
      },
      ),
      title: Text("Tienda"),
      actions: <Widget>[
        NamedIcon(
          iconData: Icons.shopping_bag_outlined,
          notificationCount: 0,
          onTap: () {},
        ),
        NamedIcon(
          iconData: Icons.notifications_outlined,
          notificationCount: 1,
          onTap: () {},
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.person_outline,size: 35,),
        )
      ],
    );
  }
}