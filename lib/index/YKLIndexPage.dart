import 'package:flutter/material.dart';
import 'package:flutter_app_start/home/home_page.dart';
import 'package:flutter_app_start/test.dart';
import 'navigation_icon_view.dart';



class YKLIndexPage extends StatefulWidget {
  @override

  State<YKLIndexPage> createState() => _YKLIndexPageState();
}

class _YKLIndexPageState extends State<YKLIndexPage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    super.initState();

    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assessment),
        title: new Text("test"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.assessment),
        title: new Text("gird"),
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new RandomWords(),
      new HomePage(),
    ];

    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();

    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) => navigationIconView.item)
            .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
      }
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      //theme: GlobalConfig.themeData,
    );
  }
}














