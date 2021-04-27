import 'package:butce/state/islemlerState.dart';
import 'package:butce/UI/toast/successToast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> islemSilDialog(BuildContext context, {@required int hiveIndex}) {
  final myIslemler = Provider.of<IslemlerState>(context, listen: false);

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Sil"),
        content: Text("Silmek istediğinizden emin misiniz?"),
        actions: [
          FlatButton(
            textColor: Colors.white,
            color: Colors.black87,
            onPressed: () => Navigator.pop(context),
            child: Text("GERİ"),
          ),
          FlatButton(
            textColor: Colors.white,
            color: Colors.red,
            onPressed: () => myIslemler.islemSil(hiveIndex).then((value) {
              successToast(context, "Silindi");
              Navigator.pop(context);
            }),
            child: Text("SİL"),
          ),
        ],
      );
    },
  );
}
