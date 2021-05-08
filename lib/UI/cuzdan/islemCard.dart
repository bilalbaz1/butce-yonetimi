import 'package:butce/UI/dialog/islemSilDialog.dart';
import 'package:butce/model/islemlerModel.dart';
import 'package:flutter/material.dart';

Widget islemCard(BuildContext context,
    {@required IslemlerModel islemlerModel}) {
  IslemlerModel model = islemlerModel;
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
    case "Hobi":
      leadingIcon = Icons.sports_esports_outlined;
      leadingBgc = Colors.pink;
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
