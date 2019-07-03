import 'package:flutter/material.dart';
import 'package:flutter_app/model/sales_model.dart';

class SalesNav extends StatelessWidget {
  final SalesBox salesBox;

  const SalesNav({Key key, this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(
                salesBox.icon ?? '',
                height: 15,
                fit: BoxFit.fill,
              ),
              Container(
                height: 20,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient:
                        LinearGradient(colors: [Colors.redAccent, Colors.red])),
                child: Text(
                  '获取更多福利',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
