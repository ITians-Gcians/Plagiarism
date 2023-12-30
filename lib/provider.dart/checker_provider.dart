import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/checker_item.dart';

class CheckerProvider with ChangeNotifier {
  List<CheckerItem> _checker_Item = [];
  List<CheckerItem> get checker_Item {
    return [..._checker_Item];
  }

  bool _buttonPressed = false;

  bool get buttonPressed => _buttonPressed;

  void setButtonPressed(bool value) {
    _buttonPressed = value;
    notifyListeners();
  }

  TextEditingController? _controllerTitle;
  TextEditingController? get controllerTitle => _controllerTitle;

  checkerController() {
    if (_controllerTitle != null) {
      _controllerTitle!.dispose();
    }

    _controllerTitle = TextEditingController();

    Future.microtask(() {
      notifyListeners();
    });
  }

  bool _isPlagiarized = false;
  double _plagiarismPercentage = 0.0;
  String _url = " ";
  String get url => _url;
  double _percent = 0.0;
  double get percent => _percent;
  List<Map<String, dynamic>> _matches = [];
  List<Map<String, dynamic>> get matches => _matches;

  bool get isPlagiarized => _isPlagiarized;
  double get plagiarismPercentage => _plagiarismPercentage;

  Future<void> fetchData() async {
    if (controllerTitle == null) {
      print('Error: controllerTitle is null');
      return;
    }
    final url = 'https://plagremoverpro.com/pcp?text=${controllerTitle!.text}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Print the entire response body
        print('response.body: $responseData');

        // Access properties from the parsed JSON
        final matches = responseData['matches'];
        if (matches.isNotEmpty) {
          final match = matches[0]; // Assuming you want the first match
          final percent = match['percent'];
          final url = match['url'];

          // Print the values
          print('Percent: $percent');
          print('URL: $url');

          final percentageMatch =
              RegExp(r'\b(\d+(\.\d+)?)%').firstMatch(percent);

          // Print the matched percentage group
          print('percentageMatch: $percentageMatch');

          _percent = percentageMatch != null
              ? double.parse(percentageMatch.group(1)!)
              : 0.0;
          _url = url;
          _matches = List<Map<String, dynamic>>.from(matches);
        } else {
          // Handle no matches case
          print('No matches found');
          _percent = 0.0;
          _url = "";
          _matches = [];
        }

        notifyListeners();
      } else {
        // Handle error status codes
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      print('Error during network request: $error');
    }
  }

  // void addcheckerItem(String Title) {
  //   final newCheckerItem =
  //       CheckerItem(id: DateTime.now().toString(), title: Title);
  //   _checker_Item.add(newCheckerItem);
  //   setButtonPressed(true);
  //   notifyListeners();
  // }

  // void removeItem(String id) {
  //   _checker_Item.removeWhere((item) => item.id == id);
  //   // setButtonPressed(false);
  //   notifyListeners();
  // }
}
