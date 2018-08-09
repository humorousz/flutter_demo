import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_start/network/AliENetRequest.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  List<String> dataList = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "home",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GirdView"),
        ),
        body: buildGridView(context, dataList),
      ),
    );
  }

  loadData() async {
    //AliENetRequest
    Map<String, String> params = {
      "key": "5689ede0a2e303e045f8ada57b9239cb",
      "num": "10"
    };
    AliENetRequest.get("http://api.tianapi.com/meinv/", params, (data) {
      print("success");
      Map pirateNames = json.decode(data);
      List list;
      list = pirateNames['newslist'];
      for (Map item in list) {
        dataList.add(item['picUrl']);
      }
      setState((){
        print("setState");
      });
    }, (data) {});
    print("loadData end");
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}




GridView buildGridView(BuildContext context, List data) {
  print("buildGridView");
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(data.length, (index) {
      return Center(
        child: buildGridViewItem(context, data[index]),
      );
    }),
  );
}

Widget buildGridViewItem(BuildContext context, String url) {
  print("buildGridViewItem");
  return new GestureDetector(
      onTap: () {
//        Navigator.of(context).push(new PageRouteBuilder(
//            opaque: false,
//            pageBuilder: (BuildContext context, _, __) {
//              return new YKLSubHomePage();
//            },
//            transitionsBuilder:
//                (_, Animation<double> animation, __, Widget child) {
//              return new SlideTransition(
//                position: new Tween<Offset>(
//                  begin: const Offset(1.0, 0.0),
//                  end: Offset.zero,
//                ).animate(animation),
//                child: child, // child is the value returned by pageBuilder
//              );
//            }));
      },
      child: AspectRatio(
        aspectRatio: 1.0/1.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: new Image.network(url,
          fit: BoxFit.cover,),
        ),
      ));
}
