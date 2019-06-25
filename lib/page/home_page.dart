import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                return Image.network(_imageUrls[index], fit: BoxFit.fill);
              },
              pagination: SwiperPagination(),
            ),
          )
        ],
      ),
    );
  }
}
