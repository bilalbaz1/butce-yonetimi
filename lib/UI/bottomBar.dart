import 'package:butce/state/bottomBarState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget bottomBar(BuildContext context) {
  final myBottomBarBloc = Provider.of<BottomBarState>(context);
  final autoSizeGroup = AutoSizeGroup();

  final iconList = <IconData>[
    SimpleLineIcons.wallet,
    FontAwesome.user_o,
  ];

  final textList = <String>[
    "Cüzdan",
    "Profil",
  ];

  return AnimatedBottomNavigationBar.builder(
    itemCount: 2,

    tabBuilder: (int index, bool isActive) {
      Color color = myBottomBarBloc.getAktifSayfa == index
          ? Colors.blue.shade400
          : Colors.grey;
      double iconSize = 23.0;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconList[index],
            size: iconSize,
            color: color,
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: AutoSizeText(
              textList[index],
              maxLines: 1,
              minFontSize: 11,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color),
              group: autoSizeGroup,
            ),
          )
        ],
      );
    },
    backgroundColor: Theme.of(context).bottomAppBarTheme.color,
    activeIndex: 0,
    splashColor: Colors.white,
    height: 60,
    // notchAndCornersAnimation: animation,
    splashSpeedInMilliseconds: 0,
    notchSmoothness: NotchSmoothness.defaultEdge,
    gapLocation: GapLocation.center,
    leftCornerRadius: 0,
    rightCornerRadius: 0,
    onTap: (index) {
      myBottomBarBloc.sayfaDegistir(index);
    },
  );
}
