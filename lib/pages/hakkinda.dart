import 'package:butce/UI/appBarWidget.dart';
import 'package:butce/UI/cuzdan/islemCard.dart';
import 'package:butce/state/islemlerState.dart';
import 'package:flutter/material.dart';

class UygulamaHakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: pageAppBar("Uygulama Hakkında")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text:
                      """Gider ve gelir takibi, para, finans takibi çok kolay. Sadece birkaç tıklama ile hızlı bir şekilde bir işlem ekleyebilirsiniz.
                      \nUygulama otomatik olarak gelir, gider grafiği oluşturur.
                      \nİşlem kategorileri sayesinde, ayrıntılı raporları inceleyebilir, işlemleri tarihe veya miktara göre kolay bir şekilde analiz edebilirsiniz.
                      \nSade ve basit arayüzü ile her kullanıcı için ideal performans ve kullanım kolaylığı sağlar.
                      \nHazır kategorileri (market, ulaşım, hobi, elektrik-su-gaz faturası, vb.) kullanabilir veya kendi kategorilerinizi oluşturabilirsiniz; uygulamayı istediğiniz gibi ayarlayın, kullanım deneyiminizi üst düzeyde tutun.
                      \n""",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.5,
                  ),
                ),
                TextSpan(
                  text: "Bu uygulama ",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18.5,
                  ),
                ),
                TextSpan(
                  text: "BYBAZ ",
                  style: TextStyle(
                    color: Color.fromRGBO(252, 205, 152, 1),
                    fontSize: 18.5,
                    fontFamily: "kalin",
                  ),
                ),
                TextSpan(
                  text:
                      "tarafından geliştirilmiştir. Açık kaynak kodlu ve tamamen ücretsizdir.",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18.5,
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
