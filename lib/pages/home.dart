import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'h_index.dart';
import 'h_me.dart';
import 'h_orderlist.dart';

class Home extends StatelessWidget {
  
  var _bodypage = new BodyPage();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'luckin coffee',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: _bodypage,
        bottomNavigationBar: new BottomNav(body: _bodypage,),
      )
    );
  }
}



class _BottomItem{
  String text;//默认文本
  Image icon;//默认图标
}




//底部导航
class BottomNav extends StatefulWidget{
  final Widget body;

  BottomNav({this.body}):super();

  @override
  State<StatefulWidget> createState() => new BottomNavState(body:body);

}

class BottomNavState extends State<BottomNav>{
  int _currentIndex = 0;
  final BodyPage body;
  List<_BottomItem> bottomitems = new List();
  
  var appBarTitles = ['首页', '菜单', '订单', '购物车',"我的"];
  var appBarIcons;

  BottomNavState({Key key,this.body}):super();

  Image getTabImage(index) {
    if(_currentIndex==index){
      return new Image.asset(appBarIcons[index][1], width: 26.0, height: 26.0);
    }else{
      return new Image.asset(appBarIcons[index][0], width: 26.0, height: 26.0);
    }
    
  }

  @override
  void initState() {
    super.initState();

    appBarIcons = [[
      "images/nav/icon_navigation_home_negative.png",
      "images/nav/icon_navigation_home_active.png",
    ],[
      "images/nav/icon_navigation_drink_negative.png",
      "images/nav/icon_navigation_drink_active.png",
    ],[
      "images/nav/icon_navigation_order_negative.png",
      "images/nav/icon_navigation_order_active.png",
    ],[
      "images/nav/icon_navigation_shopping_cart_negative.png",
      "images/nav/icon_navigation_shopping_cart_active.png",
    ],[
      "images/nav/icon_navigation_mine_negative.png",
      "images/nav/icon_navigation_mine_active.png",
    ]];

  }

  List<BottomNavigationBarItem> _getitems(){

    bottomitems = new List<_BottomItem>();
    _BottomItem item1 = new _BottomItem();
    item1.text = "首页";
    item1.icon = getTabImage(0);
    bottomitems.add(item1);

    _BottomItem item2 = new _BottomItem();
    item2.text="菜单";
    item2.icon = getTabImage(1);
    bottomitems.add(item2);

    _BottomItem item3 = new _BottomItem();
    item3.text="订单";
    item3.icon = getTabImage(2);
    bottomitems.add(item3);

    _BottomItem item4 = new _BottomItem();
    item4.text="购物车";
    item4.icon = getTabImage(3);
    bottomitems.add(item4);

    _BottomItem item5 = new _BottomItem();
    item5.text="我的";
    item5.icon = getTabImage(4);
    bottomitems.add(item5);

    return bottomitems.map((item){
      return new BottomNavigationBarItem(
        title: new Text(item.text),
        icon: item.icon,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
   
    return new CupertinoTabBar(
      currentIndex: _currentIndex,
      activeColor: Color.fromRGBO(42, 76, 126, 1.0),
      inactiveColor: Color.fromRGBO(56, 70, 102, 1.0),
      items: _getitems(),
      onTap: (index){
        setState(() {
          _currentIndex = index;
          body.setIndex(index);
        });
      },
    );
  }

}


//内容区域

class BodyPage extends StatefulWidget{

  var state = new BodyPageState();

  @override
  State<StatefulWidget> createState() => state;
  
  void setIndex(int index){
      state.setIndex(index);
      
  }

}

class BodyPageState extends State<BodyPage>{
  var _cindex = 0;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _cindex,
      children: <Widget>[
        new HomeIndex(),
        new Center(
          child: new Text('菜单'),
        ),
        new OrderList(),
        new Center(
          child: new Text('购物车'),
        ),
        new HomeMe()
      ],
    );
  }

  void setIndex(int index){
    setState(() {
      _cindex = index;
    });
  }

}
