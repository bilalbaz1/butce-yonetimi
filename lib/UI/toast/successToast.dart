import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

successToast(BuildContext context, String text) {
  AchievementView(
    context,
    title: text,
    subTitle: " ",
    //onTab: _onTabAchievement,
    icon: Icon(
      Feather.thumbs_up,
      color: Colors.white,
    ),
    //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
    //borderRadius: 5.0,
    color: Colors.green,
    textStyleTitle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    //textStyleSubTitle: TextStyle(),
    alignment: Alignment.topCenter,
    duration: Duration(seconds: 3),
    //isCircle: false,
    listener: (status) {
      print(status);
      //AchievementState.opening
      //AchievementState.open
      //AchievementState.closing
      //AchievementState.closed
    },
  )..show();
}
