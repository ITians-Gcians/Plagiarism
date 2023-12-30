import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConditionScreen extends StatefulWidget {
  static const routename = '/condition';
  ConditionScreen({super.key});

  @override
  State<ConditionScreen> createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {
  WebViewController? _controller;
  bool isload = false;

  @override
  void initState() {
    termsUrl();
    super.initState();
  }

  termsUrl() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            print(progress);
          },
          onPageStarted: (String url) {
            setState(() {
              isload = true;
            });
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print("error");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://plagremoverpro.com/terms'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: isload
          ? WebViewWidget(controller: _controller!)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
