import 'package:flutter/material.dart';

class HomeMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new MeHeader(),
              new MeList(),
            ],
          )
        ]
      ),
    );
  }
}

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                padding: EdgeInsets.only(
                    top: 60.0, bottom: 60.0, left: 20.0, right: 20.0),
                color: Color(0xff604A3D),
                child: new Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new AssetImage("images/banner.jpg"),
                      radius: 32.0,
                    ),
                    new Expanded(
                      child: new Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: new Text('Puter',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.0))),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffcccccc),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        new Positioned(
          right: 10.0,
          top: 10.0,
          child: new GestureDetector(
            child:
                new Icon(Icons.notifications, color: Colors.white, size: 26.0),
            onTap: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('消息中心'),
                  backgroundColor: Color.fromRGBO(56, 70, 102, 1.0),
                  duration: new Duration(seconds: 1)));
            },
          ),
        )
      ],
    );
  }
}

class _ItemModel {
  String title;
  Icon icon;
  String describe;
  GestureTapCallback onTap;
  _ItemModel(
      {String title,
      IconData icon,
      String describe: "",
      GestureTapCallback onTap}) {
    this.title = title;
    this.icon = new Icon(icon, color: Color(0xffcccccc),size: 20.0,);
    this.describe = describe;
    this.onTap = onTap;
  }
}

class MeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MeListState();
}

class MeListState extends State<MeList> {
  List<_ItemModel> alllist = new List();
  @override
  void initState() {
    super.initState();

    alllist.add(new _ItemModel(
        title: "个人资料",
        icon: Icons.contact_mail,
        onTap: () {
          print('object');
        }));
    alllist.add(new _ItemModel(
        title: "咖啡钱包", icon: Icons.local_cafe, describe: '1杯', onTap: () {}));
    alllist.add(new _ItemModel(
        title: "优惠券",
        icon: Icons.local_activity,
        describe: '0张',
        onTap: () {}));
    alllist
        .add(new _ItemModel(title: "发票管理", icon: Icons.receipt, onTap: () {}));
    alllist.add(new _ItemModel(title: "-"));
    alllist.add(new _ItemModel(title: "帮助反馈", icon: Icons.help, onTap: () {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: alllist.map((_ItemModel item) {
      return new Column(
        children: <Widget>[
          _listItem(item),
          new Divider(
            height: 0.5,
          )
        ],
      );
    }).toList());
  }

  Widget _listItem(_ItemModel item, {GestureTapCallback onTap}) {
    if (item.title == '-') {
      return Container(
        height: 10.0,
          decoration: new BoxDecoration(color: Color(0xfff5f5f5)),
          padding: EdgeInsets.all(5.0));
    }
    return new Material(
      color: Colors.white,
      child: new InkWell(
        child: new Container(
            padding: EdgeInsets.only(
                top: 14.0, bottom: 14.0, left: 12.0, right: 12.0),
            child: new Row(
              children: <Widget>[
                item.icon,
                new Expanded(
                  child: new Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: new Text(item.title)),
                ),
                new Row(children: <Widget>[
                  new Text(item.describe),
                  new Icon(Icons.keyboard_arrow_right, color: Color(0xffcccccc))
                ]),
              ],
            )),
        onTap: item.onTap,
      ),
    );
  }
}
