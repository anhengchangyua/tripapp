import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/model/local_nav_list_model.dart';

class LocalNav extends StatelessWidget {
  final List<LocalNavList> localNavList;

  const LocalNav({Key key, this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container 方便定义宽高
    return Container(
      height: 64,
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
    if (localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: items);
  }

  Widget _item(BuildContext context, LocalNavList model) {
    return GestureDetector(
      //手势
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            model.icon,
            width: 32,
            height: 32,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
