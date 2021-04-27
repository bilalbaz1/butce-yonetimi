import 'package:butce/UI/dialog/islemSilDialog.dart';
import 'package:butce/model/islemlerModel.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class IslemlerListe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myIslemler = Provider.of<IslemlerState>(context);

    if (myIslemler.getDurum == IslemlerDurum.IslemlerBos) {
      return Center(child: CircularProgressIndicator());
    } else if (myIslemler.getDurum == IslemlerDurum.IslemlerHata) {
      return Center(child: Text("Hata oluştu."));
    } else {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 30, top: 15),
        physics: ClampingScrollPhysics(),
        itemCount: myIslemler.getTumIslemler.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            int _totalSteps =
                myIslemler.getGelir.toInt() - myIslemler.getGider.toInt() <= 0
                    ? 100
                    : myIslemler.getGelir.toInt() + myIslemler.getGider.toInt();
            int _currentStep =
                myIslemler.getGelir.toInt() - myIslemler.getGider.toInt() <= 0
                    ? 0
                    : myIslemler.getGelir.toInt();

            return Column(
              children: [
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: CircularStepProgressIndicator(
                    totalSteps: _totalSteps,
                    currentStep: _currentStep,
                    stepSize: 10,
                    selectedColor: Color.fromRGBO(86, 222, 222, 1),
                    unselectedColor: Color.fromRGBO(243, 108, 88, 1),
                    padding: 0,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    selectedStepSize: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bakiye",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "₺ " + myIslemler.getBakiye.toInt().toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    //roundedCap: (_, __) => true,
                  ),
                ),
                if (myIslemler.getTumIslemler.length == 0)
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Yeni bir işlem eklemek için (+) butonuna basın.\nSilmek istediğiniz işlemin üzerine basılı tutun.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 19,
                      ),
                    ),
                  ),
              ],
            );
          } else {
            IslemlerModel model = myIslemler.getTumIslemler[index - 1];
            IconData leadingIcon;
            Color leadingBgc;
            String _tarih = model.tarih != null
                ? "${model.tarih.day}.${model.tarih.month}.${model.tarih.year}"
                : "  ";

            switch (model.kategori) {
              case "Market":
                leadingIcon = Icons.local_grocery_store_outlined;
                leadingBgc = Color.fromRGBO(255, 75, 75, 1);
                break;
              case "Ulaşım":
                leadingIcon = Icons.commute_outlined;
                leadingBgc = Color.fromRGBO(73, 233, 255, 1);
                break;
              default:
                leadingIcon = Icons.attach_money_outlined;
                leadingBgc = Color.fromRGBO(140, 112, 255, 1);
            }
            return GestureDetector(
              onLongPress: () => islemSilDialog(
                context,
                hiveIndex: model.hiveIndex,
              ),
              child: Card(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: leadingBgc,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          leadingIcon,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.baslik,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: stl1,
                            ),
                            SizedBox(height: 2),
                            Text(
                              _tarih,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: stl3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 15),
                          child: Text(
                            "₺ ${model.isKazanc ? '+' : '-'} ${model.tutar}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: stl2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    }
  }

  TextStyle stl1 = TextStyle(
    color: Colors.grey.shade700,
    fontFamily: "kalin",
    fontSize: 18.4,
  );

  TextStyle stl2 = TextStyle(
    color: Colors.blue.shade600,
    fontFamily: "kalin",
    fontSize: 17,
  );

  TextStyle stl3 = TextStyle(
    color: Colors.black54,
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );
}
