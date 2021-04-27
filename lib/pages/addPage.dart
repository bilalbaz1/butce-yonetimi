import 'package:butce/UI/appBarWidget.dart';
import 'package:butce/UI/toast/successToast.dart';
import 'package:butce/UI/toast/warningToast.dart';
import 'package:butce/model/islemlerModel.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _tutarCtrl = TextEditingController();
  TextEditingController _baslikCtrl = TextEditingController();
  String _kategori = "Diğer";
  bool _isKazanc = true;

  List<String> kategoriListe = [
    "Market",
    "Ulaşım",
    "Diğer",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pageAppBar("Ekle"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FlatButton.icon(
                    onPressed: () => setState(() => _isKazanc = true),
                    color: _isKazanc ? Colors.blue : Colors.black12,
                    label: Text(
                      "Gelir",
                      style: TextStyle(
                        color: _isKazanc ? Colors.white : Colors.black87,
                      ),
                    ),
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: _isKazanc ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton.icon(
                    onPressed: () => setState(() => _isKazanc = false),
                    color: _isKazanc == false ? Colors.blue : Colors.black12,
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: _isKazanc == false ? Colors.white : Colors.black87,
                    ),
                    label: Text(
                      "Gider",
                      style: TextStyle(
                        color:
                            _isKazanc == false ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kategoriListe.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ElevatedButton(
                    child: Text(
                      kategoriListe[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () =>
                        setState(() => _kategori = kategoriListe[index]),
                    style: ElevatedButton.styleFrom(
                      primary: _kategori == kategoriListe[index]
                          ? Colors.blue
                          : Colors.grey,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              cursorColor: Colors.blue,
              controller: _baslikCtrl,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Başlık",
                helperText:
                    "Bu işlemi daha sonra hatırlamanızda kolaylık sağlayacak.",
                hintStyle: TextStyle(
                  color: Colors.black54,
                ),
                border: border,
                focusedBorder: focusedBorder,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              cursorColor: Colors.blue,
              controller: _tutarCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "${_isKazanc ? 'Kazanç' : 'Harcama'} tutarı",
                hintStyle: TextStyle(
                  color: Colors.black54,
                ),
                border: border,
                focusedBorder: focusedBorder,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: FlatButton(
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.indigo,
                child: Text(
                  "Kaydet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () async {
                  final myIslemler =
                      Provider.of<IslemlerState>(context, listen: false);

                  if (_baslikCtrl.text.length < 1 ||
                      _tutarCtrl.text.length < 1) {
                    warningToast(context, "Gerekli alanları doldurun.");
                  } else {
                    bool durum = await myIslemler.islemEkle(
                      IslemlerModel(
                        baslik: _baslikCtrl.text,
                        kategori: _kategori,
                        isKazanc: _isKazanc,
                        tutar: double.parse(_tutarCtrl.text),
                        kartNo: 0,
                        tarih: DateTime.now().toLocal(),
                      ),
                    );
                    durum
                        ? successToast(context, "Başarıyla eklendi")
                        : warningToast(context, "Hata");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: new BorderSide(
      color: Colors.indigo,
      width: 1.0,
    ),
  );

  InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0,
    ),
  );
}
