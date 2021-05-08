import 'package:butce/UI/cuzdan/islemlerListe.dart';
import 'package:butce/state/bilgilerState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Cuzdan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBilgilerState = Provider.of<BilgilerState>(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.8,
                color: Color.fromRGBO(5, 11, 27, 1),
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: SizedBox(),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(18, 50, 18, 2),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        myBilgilerState.getBilgilerDurum ==
                                BilgilerDurum.BilgilerDolu
                            ? myBilgilerState.getBilgiler.resim
                            : "assets/img/ic_launcher.png",
                        height: 70,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12, right: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hoşgeldin,",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.4,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              myBilgilerState.getBilgilerDurum ==
                                      BilgilerDurum.BilgilerDolu
                                  ? myBilgilerState.getBilgiler.ad
                                  : "...",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "kalin",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(child: IslemlerListe()),
              ],
            ),
          ),
          // Positioned(
          //   top: ((MediaQuery.of(context).size.height / 3) / 2) + 20,
          //   child: Column(
          //     children: [

          //       Expanded(child: IslemlerListe()),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
