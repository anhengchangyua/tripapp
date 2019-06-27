import 'package:flutter/material.dart';
import 'package:flutter_app/model/home_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'dart:convert';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
  ];

  double appBarAlpha = 0;
  String resultString = '';

  _onScroll(offset) {
    print(offset);
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

//  loadData() {
//    HomeDao.fetch().then((result) {
//      setState(() {
//        resultString = json.encode(result);
//      });
//    }).catchError((e) {
//      resultString = e.toString();
//    });
//  }

  loadData() async {
    try {
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        resultString = json.encode(homeModel);
      });
    } catch (e) {
      resultString = e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
              onNotification: (scrollNotification) {
                //监听列表滚动
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      onTap: (int) {
                        print(int);
                      },
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(_imageUrls[index],
                            fit: BoxFit.fill);
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text(resultString),
                    ),
                  )
                ],
              )),
        )),
        Opacity(
          //具有opacity能力的组件
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            ),
          ),
          opacity: appBarAlpha,
        )
      ],
    );
  }
}
