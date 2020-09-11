import 'package:flutter/material.dart';
import 'package:stubbbb/Models/InterShip.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpInterships.dart';
import 'KaPage.dart';




class KarAmouziPage extends StatefulWidget {
  Profile profile;
  KarAmouziPage({this.profile});

  @override
  _KarAmouziPageState createState() => _KarAmouziPageState();
}

class _KarAmouziPageState extends State<KarAmouziPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(primaryIconTheme: IconThemeData(color: R.color.banafshmain)),
        debugShowCheckedModeBanner: false,
        home: new Directionality(
            textDirection: TextDirection.rtl,
            child: new SafeArea(
              child: new Scaffold(
                floatingActionButton: floatingKaramouziScreen(),
                backgroundColor: Color(0xfff2f3f8),
                drawer: DrawerLists(),
                appBar: appBarKaramouziScreen(),
                body: KarAmouziListList(),
              ),
            )));
  }
}



class KarAmouziListList extends StatefulWidget {
  @override
  _KarAmouziListListState createState() => _KarAmouziListListState();
}

class _KarAmouziListListState extends State<KarAmouziListList> {

  List<InterShip> interShips = [];
  bool isLoading = false;
  Map body=new Map();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInterships();
  }

  _getInterships() async {
    var response = await HttpInterships.getData();
    setState(() {
      interShips.addAll(response['advertisings']);
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return new ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KaPage()),
                );
              },
              child: new Container(
                margin: const EdgeInsets.only(right: 6.0, bottom: 5.0, top: 10.0, left: 9.0),
                height: phonesize.height * 0.15,
                decoration: decorationKaramouziScreen(),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(right: 4.0,left: 3.0),
                      height: phonesize.height * 0.14,
                      width: phonesize.width * 0.32,
                      decoration: boxDecorationKaramouziScreen(),
                    ),
                    new Expanded(
                        child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          textoneKaramouziScreen(),
                          textTwoKaramouziScreen(),
                          new Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: textthreeKaramouziScreen()
                              ),
                              textfourKaramouziScreen(),
                              textfiveKaramouziScreen(),
                              new Padding(
                                padding:const EdgeInsets.only(left: 5.0, right: 20.0),
                                child: circleAvatarKaramouziScreen()
                              )
                          ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  decoration: boxDecorationKaramouziScrenn(),
                                  child: new Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    child: textKarAmouziScreen()
                                  )),
                              new Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  decoration: boxDecorationKaramouziScrenn(),
                                  child: new Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    child: textKarAmoziScreen(),
                              )),
                              new Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  decoration: boxDecorationKaramouziScrenn(),
                                  child: new Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    child: textKarAmouzziScreen(),
                                  )),
                            ],
                          ),
                        new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new Row(
                              children: <Widget>[
                                iconKarAmouziScreen(),
                                new SizedBox(width: 1.0),
                                texKarAmouziScreen()
                              ],
                        )),
                      ],
                    ))
                  ],
                ),
              ),
            ));
  }
}
