import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  const WebView(
      {Key key,
      this.icon,
      this.title,
      this.url,
      this.statusBarColor,
      this.hideAppBar})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewReference = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    webViewReference.close();
    webViewReference.onUrlChanged.listen((String url) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
