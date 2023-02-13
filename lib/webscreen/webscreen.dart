
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class webscreen extends StatefulWidget {
  final String url;
  final String title;
  const webscreen({Key? key,required this.url,required this.title}) : super(key: key);

  @override
  State<webscreen> createState() => _webscreenState();
}

class _webscreenState extends State<webscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()
    {
      if(Platform.isAndroid) WebView.platform=AndroidWebView();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    ));
  }
}
