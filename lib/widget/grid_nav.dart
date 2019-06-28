import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';

class GridNavWidget extends StatelessWidget {
  final GridNav gridNav;
  final String name;

  const GridNavWidget({Key key, @required this.gridNav, this.name = '测试'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}
