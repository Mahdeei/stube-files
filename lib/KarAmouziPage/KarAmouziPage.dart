import 'package:flutter/material.dart';
import 'package:stubbbb/KarAmouziPage/AddIntern.dart';
import 'package:stubbbb/Models/InterShip.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpInterships.dart';
import 'package:stubbbb/http/maxID.dart';
import 'KaPage.dart';




class KarAmouziPage extends StatefulWidget {
  MyData profile;

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
                floatingActionButton: new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (ctx)=> AddInternPost(profile: widget.profile,)));
                  },
                  backgroundColor: R.color.banafshmain,
                  child: new Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color(0xfff2f3f8),
                drawer: DrawerLists(),
                appBar: appBarKaramouziScreen(),
                body: KarAmouziListList(profile: widget.profile),
              ),
            )));
  }
}



class KarAmouziListList extends StatefulWidget {
  MyData profile;
  KarAmouziListList({this.profile});
  @override
  _KarAmouziListListState createState() => _KarAmouziListListState();
}

class _KarAmouziListListState extends State<KarAmouziListList> {

  List<InterShip> interShips = [];
  bool isLoading = false;
  Map body=new Map();
  ScrollController scrollController = ScrollController();
  bool onRefresh = false;
  int firstid, lastid;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    scrollController.addListener(() {
      double maxscrol = scrollController.position.maxScrollExtent;
      double currscrol = scrollController.position.pixels;
      if (maxscrol - currscrol >= 200) {
        if (firstid > 0) {
          getDataAgain();
        }
      }
    });
  }
  getId() async {
    lastid = await ReceiveMaxid.getInterID();
    setState(() {
      if(onRefresh) interShips.clear();
      if(lastid<10){
        firstid = 1;
      }else{
        firstid = lastid - 10;
      }

    });


    await _getInterships();
  }

  getDataAgain() async {
    setState(() {
      if (firstid > 10) {
        firstid = firstid - 10;
        lastid = lastid - 10;
      } else if (firstid == 10) {
        firstid = firstid - 9;
        lastid = lastid - 10;
      } else if (true) {
        firstid -= (firstid + 1);
        if (lastid > 10) {
          lastid = lastid - 10;
        }
      }
    });
    await _getInterships();
  }



  _getInterships() async {
    var response = await HttpInterships.getData({'firstid': '$firstid', 'lastid': '$lastid'});
    setState(() {
      interShips.addAll(response['interships']);
      isLoading = true;
    });
  }

  Future<Null> refreshList() async{
    setState(() {
      onRefresh=true;
    });
    await getId();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return isLoading
        ? interShips.length==0
          ? new Center(child: new Text('در حال حاضر آگهی برای نمایش وجود ندارد.'),)
          : RefreshIndicator(
            onRefresh: refreshList,
            child: new ListView.builder(
                controller: scrollController,
                itemCount: interShips.length,
                itemBuilder: (BuildContext context, int index) =>
                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KaPage(interShip: interShips[index],profile: widget.profile)),
                    );
                  },
                  child: new Container(
                    margin: const EdgeInsets.only(right: 6.0, bottom: 5.0, top: 10.0, left: 9.0),
                    height: phonesize.height * 0.14,
                    // width: phonesize.width*0.5,
                    decoration: decorationKaramouziScreen(),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: new Container(
                            margin: const EdgeInsets.only(right: 4.0,left: 3.0),
                            height: phonesize.height * 0.13,
                            width: phonesize.width * 0.30,
                            decoration: boxDecorationKaramouziScreen(interShips[index].image),
                          ),
                        ),
                        new Expanded(
                          flex: 7,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textoneKaramouziScreen(interShips[index].title),
                                    new Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: new Padding(
                                            padding: EdgeInsets.only(right: SizeConfig.imageSizeMultiplier*1.3),
                                            child: new Column(
                                            children: <Widget>[
                                              Container(
                                                  width: MediaQuery.of(context).size.width*0.6,
                                                  child: textTwoKaramouziScreen(interShips[index].description)),
                                              new Row(
                                                children: [
                                                   Expanded(
                                                     flex: 4,
                                                     child: Container(
                                                            // width: MediaQuery.of(context).size.width*0.17,
                                                            child: textthreeKaramouziScreen(interShips[index].company)
                                                        ),
                                                   ),

                                                  textlineBetween(),
                                                  Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                        margin: EdgeInsets.only(right: SizeConfig.imageSizeMultiplier*.8),
                                                        // width: MediaQuery.of(context).size.width *0.25,
                                                        child: textType(interShips[index].type,)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: new Padding(
                                              padding: EdgeInsets.only(left: SizeConfig.imageSizeMultiplier*1.3,),
                                              child: circleAvatarKaramouziScreen()
                                          ),
                                        )
                                      ],
                                    )
                                    // new Row(
                                    //   children: <Widget>[
                                    //     new Container(
                                    //         margin: const EdgeInsets.only(right: 10.0),
                                    //         decoration: boxDecorationKaramouziScrenn(),
                                    //         child: new Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    //           child: textKarAmouziScreen()
                                    //         )),
                                    //     new Container(
                                    //         margin: const EdgeInsets.only(right: 2.0),
                                    //         decoration: boxDecorationKaramouziScrenn(),
                                    //         child: new Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    //           child: textKarAmoziScreen(),
                                    //     )),
                                    //     new Container(
                                    //         margin: const EdgeInsets.only(right: 2.0),
                                    //         decoration: boxDecorationKaramouziScrenn(),
                                    //         child: new Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    //           child: textKarAmouzziScreen(),
                                    //         )),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:2.0,right: 0.0),
                                  child: Row(
                                    children: [
                                      new Icon(Icons.location_city,size: 10.0,),
                                      new SizedBox(width: 2.0,),
                                      Container(
                                        width: phonesize.width*0.5,
                                        child: new Text(
                                          interShips[index].address,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: SizeConfig.textMultiplier*1.7),),
                                      ),
                                    ],
                                  ),
                                )
                                // Container(
                                //       // height: phonesize.height*0.001,
                                //       width: phonesize.width*0.1,
                                //       child: new Row(
                                //         children: <Widget>[
                                //           iconKarAmouziScreen(),
                                //           // new SizedBox(width: 1.0),
                                //           texKarAmouziScreen(interShips[index].address),
                                //
                                //         ],
                                //       ),
                                //     )
                              ],
                            ))
                      ],
                    ),
                  ),
                )),
          )
        : Center(child: CircularProgressIndicator());
  }
}
