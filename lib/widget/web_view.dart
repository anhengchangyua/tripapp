import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebView extends StatefulWidget {
  final String icon;
  final String title;
  String url;
  final String statusBarColor;
  final bool hideAppBar;
  final bool backForbid;

  WebView(
      {Key key,
      this.icon,
      this.title,
      this.url,
      this.statusBarColor,
      this.hideAppBar,
      this.backForbid = false})
      : super(key: key) {
    if (url != null && url.contains('ctrip.com')) {
      //fix 携程H5 http://无法打开问题
      url = url.replaceAll("http://", 'https://');
    }
  }

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewReference = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onErrorState;
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    webViewReference.close();
    _onUrlChanged = webViewReference.onUrlChanged.listen((String url) {});
    _onErrorState = webViewReference.onHttpError
        .listen((WebViewHttpError error) => print(error));
    _onStateChanged =
        webViewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        //处理返回问题
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid) {
              webViewReference.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
  }

  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    super.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onErrorState.cancel();
    webViewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(
              Color(int.parse("0xff" + statusBarColorStr)), backButtonColor),
          Expanded(
              child: WebviewScaffold(
            //防止携程H5页面重定向到打开携程APP ctrip://wireless/xxx的网址
            userAgent: 'null',
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text('等待...'),
              ),
            ),
          ))
        ],
      ),
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        height: 25,
        color: backgroundColor,
      );
    }
    return Container(
        child: Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.close,
              color: backButtonColor,
              size: 26,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Center(
              child: Text(
            widget.title ?? '',
            style: TextStyle(color: backgroundColor, fontSize: 20),
          )),
        ),
      ],
    ));
  }
}
