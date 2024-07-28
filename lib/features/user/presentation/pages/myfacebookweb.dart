import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Myfacebookweb extends StatefulWidget {
  Myfacebookweb({super.key});

  @override
  State<Myfacebookweb> createState() => _MyfacebookwebState();
}

class _MyfacebookwebState extends State<Myfacebookweb> {
  late final WebViewController webViewController;
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          setState(() {
            isloading = false;
          });
        },
      ))
      ..loadRequest(
          Uri.parse('https://facebook.com/abdelrahman.elhendy.50/'
          ));}

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body:
       isloading?Center(child: CircularProgressIndicator(),):
        WebViewWidget(controller: webViewController));
    }
  }
 