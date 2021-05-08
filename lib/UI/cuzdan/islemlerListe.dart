import 'package:butce/UI/cuzdan/islemCard.dart';
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
            return islemCard(
              context,
              islemlerModel: myIslemler.getTumIslemler[index - 1],
            );
          }
        },
      );
    }
  }
}
