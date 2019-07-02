import 'package:flutter/material.dart';
import 'package:flutter_app/model/local_nav_list_model.dart';
import 'package:flutter_app/model/sub_nav_model.dart';
import 'package:flutter_app/widget/web_view.dart';

class SubNav extends StatelessWidget {
  final List<SubNavList> subNavList;

  const SubNav({Key key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container 方便定义宽高
    return Container(
      height: 94,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });
    int seprate = (subNavList.length / 2 + 0.5).toInt();

    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.sublist(0, seprate)),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.sublist(seprate, subNavList.length)),
        )
      ],
    );
  }

  Widget _item(BuildContext context, SubNavList model) {
    return Expanded(
      child: GestureDetector(
        //手势
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                        url: model.url,
                        title: model.title,
                        hideAppBar: model.hideAppBar,
                      )));
        },
        child: Column(
          children: <Widget>[
            Image.network(
              model.icon,
              width: 18,
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 10),
              ),
            )
          ],
        ),
      ),
      flex: 1,
    );
  }
}
