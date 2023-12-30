import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class PrivacyPolicyScreen extends StatefulWidget {
  static const routename = '/privacy';
  //PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  WebViewController? controller;
  bool isload = false;

  @override
  void initState() {
    // TODO: implement initState
    loadUrl();
    super.initState();
  }

  loadUrl() {
    controller = WebViewController()
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
      ..loadRequest(Uri.parse('https://plagremoverpro.com/privacy'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isload
          ? WebViewWidget(controller: controller!)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
