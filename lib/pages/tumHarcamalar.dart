import 'package:butce/UI/appBarWidget.dart';
import 'package:butce/UI/cuzdan/islemCard.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TumHarcamalar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myIslemlerState = Provider.of<IslemlerState>(context);
    return Scaffold(
      appBar: AppBar(title: pageAppBar("Tüm Harcamalar")),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: myIslemlerState.getHarcananIslemler.length,
        itemBuilder: (context, index) {
          return islemCard(
            context,
            islemlerModel: myIslemlerState.getHarcananIslemler[index],
          );
        },
      ),
    );
  }
}
