import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OrderListState();
}

class OrderListState extends State<OrderList>
    with SingleTickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('订单列表'),
            bottom: new TabBar(
              tabs: <Widget>[
                new Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: new Text('全部')),
                new Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: new Text('未完成')),
                new Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: new Text('已完成')),
              ],
              controller: _tabController,
            )),
        body: new ListView(
          children: <Widget>[
            new OrderListWidget(),
            new OrderListWidget(),
            new OrderListWidget(),
            new OrderListWidget(),
          ],
        ));
  }
}

//列表组件
class OrderListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OrderListWidgetState();
}

class OrderListWidgetState extends State<OrderListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:15.0,right:15.0),
      margin: EdgeInsets.only(top:20.0),
      decoration: new BoxDecoration(color: Color(0xffffffff)),
      child: new Column(children: <Widget>[
        new Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(width: 0.5,color: Color(0xffe3e3e3)))
          ),
          child: new Row(children: <Widget>[
            new Expanded(
              child: new Text('自提订单：32240272454613',
                  style: new TextStyle(color: Color(0xff989898))),
            ),
            new Text(
              '已完成',
              style: new TextStyle(color: Color(0xff989898)),
            )
          ])
        ),
        new Container(
          padding:EdgeInsets.only(top: 15.0),
          child:new Row(children: <Widget>[
            new Expanded(
              child:new Text('腾讯众创空间大厦店（NO.050493839）',style: new TextStyle(
                fontSize:20.0
              ),maxLines: 1,overflow: TextOverflow.ellipsis,)
            ),
            new Text('2018-08-08 12:34',style: new TextStyle(color: Color(0xff989898)),)
          ],),
        ),
        new Container(
          padding:EdgeInsets.only(top: 5.0, bottom: 15.0),
          alignment: Alignment.topLeft,
          child:new Text('拿铁等 共1件商品'),
        ),
        new Container(
          padding:EdgeInsets.only(top: 15.0, bottom: 15.0),
          child:new Row(children: <Widget>[
            new Expanded(
              child:new Text('￥0',style: new TextStyle(fontSize:18.0),)
            ),
            new InkWell(
              child: new Container(
                padding:EdgeInsets.only(top:10.0,bottom:10.0,left:24.0,right:24.0),
                decoration: new BoxDecoration(
                  border: Border.all(color:Color(0xffdddddd)),
                  borderRadius: BorderRadius.all(new Radius.circular(4.0)),
                ),
                child:new Text('再来一单')
              ),
              onTap: (){
                print('fdsa');
              },
            )
            
          ],),
        )
      ]),
    );
  }
}
