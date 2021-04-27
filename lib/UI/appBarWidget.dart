import 'package:butce/state/bilgilerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget homeAppBar(BuildContext context) {
  return Container(
    color: Colors.red,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Opacity(opacity: 0, child: Container()),
        Image.asset(
          "assets/img/ic_launcher.png",
          fit: BoxFit.cover,
          height: 50,
          width: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Feather.search),
        ),
      ],
    ),
  );
}

Widget pageAppBar(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.white,
    ),
  );
}
