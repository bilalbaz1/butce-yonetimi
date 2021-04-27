import 'dart:async';

import 'package:butce/UI/appBarWidget.dart';
import 'package:butce/UI/bottomBar.dart';
import 'package:butce/UI/drawerBar.dart';
import 'package:butce/pages/addPage.dart';
import 'package:butce/state/bottomBarState.dart';
import 'package:butce/view/cuzdan.dart';
import 'package:butce/view/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget aktifS;
  Widget aktifAppBar;

  @override
  Widget build(BuildContext context) {
    final myBottomBarBloc = Provider.of<BottomBarState>(context);

    switch (myBottomBarBloc.getAktifSayfa) {
      case 0:
        aktifS = Cuzdan();
        aktifAppBar = homeAppBar(context);
        break;
      case 1:
        aktifS = Profil();
        aktifAppBar = pageAppBar("Profil");
        break;
      default:
        aktifS = Cuzdan();
        aktifAppBar = homeAppBar(context);
    }

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => AddPage(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: aktifS,
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    final cikText = "Çıkmak için tekrar tıklayın.";
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: cikText);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
