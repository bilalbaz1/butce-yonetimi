import 'package:butce/UI/dialog/adDegistirDialog.dart';
import 'package:butce/state/bilgilerState.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          card(
            title: "Harcanan TL",
            number: myIslemlerState.getGider.toInt(),
            pngImg: "money",
          ),
          SizedBox(height: 15),
          card(
            title: "Kazanılan TL",
            number: myIslemlerState.getGelir.toInt(),
            pngImg: "money-bag",
          ),
        ],
      ),
    );
  }

  Widget card({
    @required String title,
    @required int number,
    Color color: Colors.white,
    @required String pngImg,
  }) {
    return Card(
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
        trailing: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.purple.shade600,
            fontSize: 20,
            fontFamily: "kalin",
          ),
        ),
      ),
    );
  }
}
