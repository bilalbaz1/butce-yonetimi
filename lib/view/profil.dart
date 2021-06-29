import 'package:butce/UI/cuzdan/islemCard.dart';
import 'package:butce/UI/dialog/adDegistirDialog.dart';
import 'package:butce/model/islemlerModel.dart';
import 'package:butce/pages/dovizSayfasi.dart';
import 'package:butce/pages/hakkinda.dart';
import 'package:butce/pages/tumHarcamalar.dart';
import 'package:butce/pages/tumKazanclar.dart';
import 'package:butce/state/bilgilerState.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transitionType = ContainerTransitionType.fade;
    final myBilgilerState = Provider.of<BilgilerState>(context);
    final myIslemlerState = Provider.of<IslemlerState>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 2),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              myBilgilerState.getBilgilerDurum == BilgilerDurum.BilgilerDolu
                  ? myBilgilerState.getBilgiler.resim
                  : "assets/img/ic_launcher.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              myBilgilerState.getBilgilerDurum == BilgilerDurum.BilgilerDolu
                  ? myBilgilerState.getBilgiler.ad
                  : "...",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontFamily: "kalin",
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                MaterialCommunityIcons.account_edit,
                color: Colors.amber.shade600,
                size: 32,
              ),
              onPressed: () => adDegistirDialog(context),
            ),
          ),
          SizedBox(height: 30),
          OpenContainer(
            openBuilder: (context, _) => TumHarcamalar(),
            closedBuilder: (context, VoidCallback openContainer) => card(
              context: context,
              title: "Harcanan TL",
              number: myIslemlerState.getGider.toInt(),
              pngImg: "money",
              sonIslemModel: myIslemlerState.getHarcananIslemler.length > 0
                  ? myIslemlerState.getHarcananIslemler[0]
                  : null,
            ),
            // CardWidget(
            //   index: 1,
            //   onClicked: openContainer,
            // ),
            // child: GestureDetector(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ,
            //     ),
            //   ),
            //   child: card(
            //     context: context,
            //     title: "Harcanan TL",
            //     number: myIslemlerState.getGider.toInt(),
            //     pngImg: "money",
            //     sonIslemModel: myIslemlerState.getHarcananIslemler.length > 0
            //         ? myIslemlerState.getHarcananIslemler[0]
            //         : null,
            //   ),
            // ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TumKazanclar(),
              ),
            ),
            child: card(
              context: context,
              title: "Kazanılan TL",
              number: myIslemlerState.getGelir.toInt(),
              pngImg: "money-bag",
              sonIslemModel: myIslemlerState.getKazanilanIslemler.length > 0
                  ? myIslemlerState.getKazanilanIslemler[0]
                  : null,
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          OpenContainer(
            middleColor: Colors.red,
            closedColor: Colors.transparent,
            openColor: Colors.blue,
            transitionType: transitionType,
            transitionDuration: Duration(seconds: 1),
            closedBuilder: (context, closeContainer) => card(
              context: context,
              title: "Döviz",
              pngImg: "doviz",
              icon: Icons.arrow_right_outlined,
              sonIslemModel: null,
            ),
            openBuilder: (context, openBuilder) => DovizSayfasi(),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          OpenContainer(
            closedColor: Colors.orange,
            transitionType: transitionType,
            transitionDuration: Duration(seconds: 5),
            openBuilder: (context, _) => UygulamaHakkinda(),
            closedBuilder: (context, _) => Container(
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Uygulama Hakkında",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "kalin",
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget card({
    @required BuildContext context,
    @required String title,
    int number,
    Color color: Colors.white,
    @required String pngImg,
    IslemlerModel sonIslemModel,
    IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: color,
          elevation: 3.0,
          child: ListTile(
            leading: Padding(
              padding: EdgeInsets.all(7.0),
              child: Image.asset(
                "assets/img/" + pngImg + ".png",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.indigo.shade400,
                fontSize: 20,
                fontFamily: "kalin",
              ),
            ),
            trailing: number == null
                ? Icon(icon)
                : Text(
                    number.toString(),
                    style: TextStyle(
                      color: Colors.purple.shade600,
                      fontSize: 20,
                      fontFamily: "kalin",
                    ),
                  ),
          ),
        ),
        if (sonIslemModel != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Son İşlem :",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              islemCard(context, islemlerModel: sonIslemModel),
            ],
          ),
      ],
    );
  }
}
