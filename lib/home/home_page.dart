import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => new _HomePageState();

}


class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "home",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GirdView"),
        ),
        body: buildGridView(context),
      ),
    );
  }
}

GridView buildGridView(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(20, (index) {
      return Center(
        child: buildGridViewItem(context),
      );
    }),
  );
}

Widget buildGridViewItem(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Image.network('http://up.qqjia.com/z/25/tu32710_4.jpg'),
      ));
}

