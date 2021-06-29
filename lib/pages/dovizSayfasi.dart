import 'package:butce/helper/api/dovizApi.dart';
import 'package:butce/helper/locator.dart';
import 'package:butce/model/dovizModel.dart';
import 'package:flutter/material.dart';

class DovizSayfasi extends StatefulWidget {
  const DovizSayfasi({Key key}) : super(key: key);

  @override
  _DovizSayfasiState createState() => _DovizSayfasiState();
}

class _DovizSayfasiState extends State<DovizSayfasi> {
  final _api = locator<DovizApi>();
  List<DovizModel> list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Döviz - TL")),
      body: list == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Color textColor = Colors.indigo;
                if (list[index].buying < 1) {
                  textColor = Colors.green.shade400;
                } else if (list[index].buying < 3) {
                  textColor = Colors.black87;
                } else if (list[index].buying < 5) {
                  textColor = Colors.red.shade900;
                } else {
                  textColor = Colors.redAccent;
                }
                return Card(
                  child: ListTile(
                    title: Text(list[index].code + " - " + list[index].name),
                    subtitle: Text("Güncelleme Saati : " + list[index].time),
                    trailing: Text(
                      list[index].buying.toString(),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> getData() async {
    var data = await _api.tlDoviz();

    setState(() {
      list = data;
    });
  }
}
