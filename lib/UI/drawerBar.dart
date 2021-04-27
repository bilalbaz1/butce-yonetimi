import 'package:butce/state/bilgilerState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

Widget drawerBar(BuildContext context) {
  final myBilgilerState = Provider.of<BilgilerState>(context);

  if (myBilgilerState.getBilgiler == null) {
    return Drawer(child: CupertinoActivityIndicator());
  } else
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/myProfil"),
              child: Container(
                alignment: Alignment.center,
                height: 130.0,
                width: double.maxFinite,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Icon(Icons.error),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            myBilgilerState.getBilgiler.ad,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "aaaaaaaa",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, right: 15),
                        child: Icon(
                          Feather.chevron_right,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListView(
                  physics:
                      ClampingScrollPhysics(), // androidin scrollview i gibi olur
                  children: <Widget>[
                    ListTile(
                      onTap: () => Navigator.pushNamed(context, "/myProfil"),
                      leading: Icon(Feather.user, color: Colors.red.shade500),
                      title: Text("bbbbbbb"),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
