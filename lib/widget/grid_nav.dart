import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/widget/web_view.dart';

class GridNavWidget extends StatelessWidget {
  final GridNav gridNav;

  const GridNavWidget({Key key, @required this.gridNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(children: _gridNavItems(context, this.gridNav)),
    );
  }

  _gridNavItems(BuildContext context, GridNav gridItem) {
    List<Widget> gridItems = [];
    if (gridItem.flight != null) {
      gridItems.add(_gridNavItem1(context, gridItem.flight, false));
    }
    if (gridItem.hotel != null) {
      gridItems.add(_gridNavItem2(context, gridItem.hotel, false));
    }
    if (gridItem.travel != null) {
      gridItems.add(_gridNavItem3(context, gridItem.travel, false));
    }
    return gridItems;
  }

  _gridNavItem1(BuildContext context, Flight gridItem, bool first) {
    List<Widget> gridItems = [];
    gridItems.add(_mainItem(context, gridItem.mainItem));
    gridItems.add(_doubleItem(context, gridItem.item1, gridItem.item3));
  }

  _gridNavItem2(BuildContext context, Hotel gridItem, bool first) {
    List<Widget> gridItems = [];
    gridItems.add(_mainItem(context, gridItem.mainItem));
    gridItems.add(_doubleItem(context, gridItem.item1, gridItem.item3));
  }

  _gridNavItem3(BuildContext context, Travel gridItem, bool first) {
    List<Widget> gridItems = [];
    gridItems.add(_mainItem(context, gridItem.mainItem));
    gridItems.add(_doubleItem(context, gridItem.item1, gridItem.item3));
  }

  _mainItem(BuildContext context, MainItem mainItem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: mainItem.url,
                      title: mainItem.title,
                      statusBarColor: mainItem.statusBarColor,
                    )));
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            mainItem.icon,
            fit: BoxFit.contain,
            height: 88,
            width: 121,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Text(mainItem.title,
              style: TextStyle(fontSize: 14, color: Colors.white))
        ],
      ),
    );
  }

  _doubleItem(BuildContext context, MainItem topItem, MainItem bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topItem, true),
        ),
        Expanded(
          child: _item(context, bottomItem, false),
        )
      ],
    );
  }

  _item(BuildContext context, MainItem item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      //撑满父布局的宽度
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: borderSide,
          bottom: first ? borderSide : BorderSide.none,
        )),
        child: _wrapGesture(
            context,
            Center(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            item),
      ),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, MainItem model) {
    return GestureDetector(
      onTap: () {},
      child: widget,
    );
  }
}
