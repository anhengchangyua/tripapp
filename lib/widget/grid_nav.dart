import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/widget/web_view.dart';

class GridNavWidget extends StatelessWidget {
  final GridNav gridNav;

  const GridNavWidget({Key key, @required this.gridNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }

  _gridNavItems(BuildContext context, GridNav gridItem) {
    List<Widget> gridItems = [];
    if (gridItem.flight != null) {
      _gridNavItem1(context, gridItem.flight, false);
    }
    if (gridItem.hotel != null) {
      _gridNavItem2(context, gridItem.hotel, false);
    }
    if (gridItem.travel != null) {}
  }

  _gridNavItem1(BuildContext context, Flight gridItem, bool first) {
    List<Widget> gridItems = [];
    gridItems.add(_mainItem(context, gridItem.mainItem));
  }

  _gridNavItem2(BuildContext context, Hotel gridItem, bool first) {
    List<Widget> gridItems = [];
    gridItems.add(_mainItem(context, gridItem.mainItem));
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
}
