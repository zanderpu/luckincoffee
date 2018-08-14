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
      return new Container(
        height: 260.0,
        child: new IndexSwiper(),
      );
    }
    if (i == 1) {
      return new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new IndexList("信达国际店","距你30m","images/nav/icon_navigation_order_negative.png"),
            new IndexList("现在下单","ORDER NOW","images/icon_order_now.png"),
            new IndexList("咖啡钱包","COFFEE WALLET","images/icon_promo.png"),
            new IndexList("企业账户","ENTERPRISE ACCOUNT","images/icon_enterprise.png"),
            
          ],
        ),
      );
    }
  }
}

class IndexSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IndexSwiperState();
}

class IndexSwiperState extends State<IndexSwiper>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    // 初始化控制器
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // 销毁
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    tabController.index = 0;

    return TabBarView(
      controller: tabController,
      children: <Widget>[
        new Image.asset(
          'images/banner.jpg',
          fit: BoxFit.cover,
        ),
        new Image.asset(
          'images/banner.jpg',
          fit: BoxFit.cover,
        )
      ],
    );
  }
}

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
              new Image.asset(imgurl, width: 40.0, height: 40.0,)
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
