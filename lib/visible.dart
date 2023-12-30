import 'package:flutter/material.dart';

class visibel extends StatefulWidget {
  const visibel({super.key});

  @override
  State<visibel> createState() => _visibelState();
}

class _visibelState extends State<visibel> {
  bool isVisible = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            loading
                ? CircularProgressIndicator()
                : Center(
                    child: Visibility(
                      visible: isVisible,
                      child: Text('Muhammad Irfan'),
                    ),
                  ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20),
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                    loading = false;
                  });
                },
                child: Text("Show/Hide")),
          ],
        ),
      ),
    );
  }
}
