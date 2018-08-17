import 'dart:async';

import 'package:flutter/material.dart';

class HomeIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 2,
      itemBuilder: (context, i) => renderRow(i),
    );
  }

  Widget renderRow(i) {
    if (i == 0) {
      return new Stack(
        children: <Widget>[
          new Container(
            height: 260.0,
            child: new IndexSwiper(),
          ),
          new Positioned(
            right: 20.0,
            top:10.0,
            child: new Container(
              padding: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(55, 55, 55, 0.6),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: new Image.asset('images/icon_scan.png',height: 20.0, width: 20.0,)
            ),
          ),
        ],
      );
      // return new Container(
      //   height: 260.0,
      //   child: new IndexSwiper(),
      // );
    }
    if (i == 1) {
      return new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new IndexStore("信达国际店","距你30m",1),
            new IndexList("现在下单","ORDER NOW","images/icon_order_now.png"),
            new IndexList("咖啡钱包","COFFEE WALLET","images/icon_promo.png"),
            new IndexList("企业账户","ENTERPRISE ACCOUNT","images/icon_enterprise.png"),
            
          ],
        ),
      );
    }
  }
}

///首页图片轮播
class IndexSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IndexSwiperState();
}

class IndexSwiperState extends State<IndexSwiper>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  double swiperindexleft = 0.0;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // 初始化控制器
    pageController = new PageController(initialPage: 0);
    print(_currentPageIndex);
    new Timer.periodic(new Duration(seconds: 5),callback);
  }

  void callback(Timer timer) {
    _currentPageIndex++;
    if(_currentPageIndex>1){
      _currentPageIndex = 0;
    }
    pageController.animateToPage(_currentPageIndex,
      duration: new Duration(microseconds: 1000),
      curve: new ElasticInOutCurve()
    );
    //print(_currentPageIndex);
  }

  @override
  void dispose() {
    // 销毁
    pageController.dispose();
    super.dispose();
  }

  List<Widget> getSwiperIndex(BuildContext context){
    List<Widget> list = new List<Widget>();
    
    for (var i = 0; i < 2; i++) {
      if(_currentPageIndex==i){
        list.add(new Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.only(right: 8.0),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(44.4),
            color: Color.fromRGBO(255, 255, 255, 1.0),
            border: Border.all(color: Colors.white,width: 0.5)
          ),
        ));
      }else{
        list.add(new Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.only(right: 8.0),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(44.4),
            color: Color.fromRGBO(155, 155, 155, 0.5),
            border: Border.all(color: Colors.white,width: 0.5)
          ),
        ));
      }
    }
    swiperindexleft = (MediaQuery.of(context).size.width-(2*18-8))/2;
    return list;
  }

  

  void _pageChanged(index){
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var swiperindex = getSwiperIndex(context);

    return Stack(
      children: <Widget>[
        new PageView(
          controller: pageController,
          children: <Widget>[
            new Image.asset(
              'images/banner.jpg',
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'images/banner2.png',
              fit: BoxFit.cover,
            )
          ],
          onPageChanged: _pageChanged,
        ),
        new Positioned(
          left: swiperindexleft,
          bottom: 10.0,
          child: new Container(
            child: new Row(
              children: swiperindex,
            ),
          ),
        ),
      ],
    );
  }
}


///首页定位门店
class IndexStore extends StatefulWidget{
  final String title;
  final String desc;
  final int type;

  IndexStore(this.title,this.desc,this.type);

  @override
  State<StatefulWidget> createState() => new IndexStoreState();
}

class IndexStoreState extends State<IndexStore>{

  Widget _storeType(){

    var _textstyle1 = new TextStyle(color:Colors.white);
    var _textstyle2 = new TextStyle(color:Colors.white);
    var _bgstyle1 = null;
    var _bgstyle2 = null;

    if(widget.type==1){
      _textstyle1 = new TextStyle(color:Color(0xff7CA7D2));
      _bgstyle2 = new BoxDecoration(
        color: Color(0xff7CA7D2),
        borderRadius:BorderRadius.all(Radius.circular(40.0))
      );
    }else{
      _textstyle2 = new TextStyle(color:Color(0xff7CA7D2));
      _bgstyle1 = new BoxDecoration(
        color: Color(0xff7CA7D2),
        borderRadius:BorderRadius.all(Radius.circular(40.0))
      );
    }
    

    return new Container(
      padding: EdgeInsets.all(2.0),
      height: 40.0,
      decoration: new BoxDecoration(
        border: Border.all(width:0.5,color:Color(0xff7CA7D2)),
        borderRadius: BorderRadius.all(Radius.circular(40.0))
      ),
      child:new Row(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(left:10.0,right:10.0,top:8.0),
            height: 40.0,
            decoration: _bgstyle1,
            child: new Text('自提',style: _textstyle1,),
          ),
          new Container(
            padding: EdgeInsets.only(left:10.0,right:10.0,top:8.0),
            height: 40.0,
            decoration: _bgstyle2,
            child: new Text('外送',style: _textstyle2,),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new GestureDetector(
        child: new Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(width: 0.5,color: Colors.grey))
          ),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: new Text(widget.title,style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),),
                    ),
                    new Text(widget.desc, style: new TextStyle(fontSize: 10.0,color: Colors.grey),)
                  ],
                ),
              ),
              _storeType()
            ],
          ),
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(widget.title),
            backgroundColor:Color.fromRGBO(56, 70, 102, 1.0),
            duration: new Duration(seconds: 1)
          ));

        },
      )
    );
  }

}

///首页导航列表
class IndexList extends StatelessWidget {
  
  final String imgurl;
  final String title;
  final String desc;

  IndexList(this.title,this.desc,this.imgurl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
      child: new GestureDetector(
        child: new Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(width: 0.5,color: Colors.grey))
          ),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: new Text(title,style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
                    ),
                    new Text(desc, style: new TextStyle(fontSize: 12.0,color: Colors.grey),)
                  ],
                ),
              ),
              new Container(
                margin:EdgeInsets.only(right:20.0),
                child:new Image.asset(imgurl, width: 45.0, height: 45.0,)
              ),
            ],
          ),
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(title),
            backgroundColor:Color.fromRGBO(56, 70, 102, 1.0),
            duration: new Duration(seconds: 1)
          ));

        },
      )
    );
  }
}
