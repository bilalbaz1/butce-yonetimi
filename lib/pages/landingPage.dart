import 'package:butce/state/loginState.dart';
import 'package:butce/index.dart';
import 'package:butce/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      create: (context) => LoginState(),
      // ignore: missing_return
      child: Consumer(builder: (context, LoginState loginState, child) {
        switch (loginState.getDurum) {
          case UserDurum.Beklemede:
            return BeklemeEkran();
          case UserDurum.OturumAciliyor:
            return BeklemeEkran();
          case UserDurum.OturumKapali:
            return LoginPage();
          case UserDurum.OturumAcik:
            return Index();
        }
      }),
    );
  }
}

class BeklemeEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(65),
            child: Image.asset(
              'assets/img/ic_launcher.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(
                "from",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "ByBaz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 171, 137, 1),
                  fontSize: 30,
                  fontFamily: "kalin",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
