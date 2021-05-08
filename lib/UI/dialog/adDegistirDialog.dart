import 'package:butce/UI/toast/warningToast.dart';
import 'package:butce/state/bilgilerState.dart';
import 'package:butce/UI/toast/successToast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> adDegistirDialog(BuildContext context) {
  final myBilgiler = Provider.of<BilgilerState>(context, listen: false);
  String seciliResim = myBilgiler.getBilgiler.resim;
  String adCtrl = myBilgiler.getBilgiler.ad;

  List<String> avatarListe = [
    "assets/img/avatarlar/a1.png",
    "assets/img/avatarlar/a2.png",
    "assets/img/avatarlar/a3.png",
    "assets/img/avatarlar/a4.png",
    "assets/img/avatarlar/a5.png",
    "assets/img/avatarlar/a6.png",
  ];

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Bilgi Güncelle"),
            content: Wrap(
              //alignment: WrapAlignment.center,
              children: [
                TextFormField(
                  cursorColor: Colors.blue,
                  initialValue: adCtrl,
                  onChanged: (str) {
                    adCtrl = str;
                  },
                  decoration: InputDecoration(
                      hintText: "Adınız",
                      labelText: "Adım",
                      labelStyle: TextStyle(
                        color: Colors.deepOrange.shade900,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      )),
                ),
                SizedBox(height: 30, child: Container()),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: avatarListe.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () =>
                          setState(() => seciliResim = avatarListe[index]),
                      child: Container(
                        color: seciliResim == avatarListe[index]
                            ? Colors.orange
                            : Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: Image.asset(
                          avatarListe[index],
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                textColor: Colors.white,
                color: Colors.black87,
                onPressed: () => Navigator.pop(context),
                child: Text("GERİ"),
              ),
              FlatButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () async {
                  if (adCtrl.trim().length > 1 && seciliResim != null) {
                    var durum = await myBilgiler.bilgiGuncelle(
                      {"ad": adCtrl, "resim": seciliResim},
                    );
                    if (durum) {
                      successToast(context, "Güncellendi.");
                      Navigator.pop(context);
                    } else
                      warningToast(context, "Hata");
                  } else {
                    warningToast(context, "Gerekli alanları doldurun.");
                  }
                },
                child: Text("KAYDET"),
              ),
            ],
          );
        },
      );
    },
  );
}
