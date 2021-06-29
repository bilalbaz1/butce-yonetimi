import 'package:butce/helper/locator.dart';
import 'package:butce/pages/addPage.dart';
import 'package:butce/pages/landingPage.dart';
import 'package:butce/state/bilgilerState.dart';
import 'package:butce/state/bottomBarState.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarState()),
        ChangeNotifierProvider(create: (context) => BilgilerState()),
        ChangeNotifierProvider(create: (context) => IslemlerState()),
      ],
      child: MaterialApp(
        title: "Bütçe Yönetimi",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          platform: TargetPlatform.iOS,
          scaffoldBackgroundColor: Color.fromRGBO(242, 242, 242, 1),
        ),
        home: LandingPage(),
        routes: {
          "/addPage": (context) => AddPage(),
        },
      ),
    );
  }
}
