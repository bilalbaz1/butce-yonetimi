import 'package:butce/UI/toast/warningToast.dart';
import 'package:butce/model/bilgilerModel.dart';
import 'package:butce/state/loginState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController adCtrl = TextEditingController();
  String resim = "assets/img/avatarlar/a1.png";

  List<String> avatarListe = [
    "assets/img/avatarlar/a1.png",
    "assets/img/avatarlar/a2.png",
    "assets/img/avatarlar/a3.png",
    "assets/img/avatarlar/a4.png",
    "assets/img/avatarlar/a5.png",
    "assets/img/avatarlar/a6.png",
  ];

  @override
  Widget build(BuildContext context) {
    final myLoginState = Provider.of<LoginState>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Image.asset(
                "assets/img/image1.jpg",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 3.4,
              ),
              SizedBox(height: 5),
              Text(
                "Merhaba,",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontFamily: "kalin",
                ),
              ),
              SizedBox(height: 12),
              Text(
                "sdals nasdjk bsahdkgh sdgaks dkg askdgyd uasydg asuasdgyas u dguıs",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Sana nasıl hitap edebilirim?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                cursorColor: Colors.blue,
                controller: adCtrl,
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
                      Radius.circular(30.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.indigo,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).iconTheme.color,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text(
                "Bir avatar seçin.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: avatarListe.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => setState(() => resim = avatarListe[index]),
                    child: Container(
                      color: resim == avatarListe[index]
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
              SizedBox(height: 15),
              TextButton(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                onPressed: () async {
                  if (adCtrl.text.trim().length > 1 && resim != null) {
                    await myLoginState.uyeOl(
                      context,
                      BilgilerModel(
                        ad: adCtrl.text,
                        resim: resim,
                      ),
                    );
                  } else {
                    warningToast(context, "Gerekli alanları doldurun.");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
