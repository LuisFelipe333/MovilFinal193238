import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';

class NavigationDrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          DrawerHeader(
            decoration: const BoxDecoration(
              color: ColorsViews.txtHeaderColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 47,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdnb.artstation.com/p/assets/images/images/035/089/407/large/ronnie-kim-pacatang-x-img-1614081511647.jpg?1614082330"),
                      radius: 45),


                ),
                Text(
                  "User",
                  style: TextStyle(color: ColorsViews.whiteColor),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              const ExpansionTile(
                title: Text('Menu 1'),
                children: <Widget>[
                  ListTile(title: Text('Sub1')),
                  ListTile(title: Text('Sub2')),
                  ListTile(title: Text('Sub3')),
                ],
              ),
              ExpansionTile(
                title: const Text('Menu 2'),
                children: const <Widget>[
                  ListTile(title: Text('Sub1')),
                  ListTile(title: Text('Sub2')),
                  ListTile(title: Text('Sub3')),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 30,
              width: 350,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Salir',
                    style: TextStyle(
                        color: ColorsViews.whiteColor,
                        fontSize: 18)),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                    return ColorsViews.backgroundButtonActiveColor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey;
                      }
                      return Colors.transparent;
                    },
                  ),
                  shape:
                  MaterialStateProperty.resolveWith<OutlinedBorder>(
                        (_) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25));
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}