// import 'package:flutter/material.dart';
// import '../model/plag_item.dart';

// class PlagProvider with ChangeNotifier {
//   List<PlagItem> _items = [];
//   List<PlagItem> get items {
//     return [..._items];
//   }

//   TextEditingController? _controllerTitle;
//   TextEditingController? get controllerTitle => _controllerTitle;
//   TextEditingController? _controllerResult;
//   TextEditingController? get controllerResult => _controllerResult;

//   instantiateController() {
//     if (_controllerTitle != null) {
//       _controllerTitle!.dispose();
//     }

//     _controllerTitle = TextEditingController();
//     _controllerResult = TextEditingController();

//     Future.microtask(() {
//       notifyListeners();
//     });
//   }

//   void clearControllerTitleText(TextEditingController? controller) {
//     controller?.clear();
//     notifyListeners();
//   }

//   void addItem(String Title, String Result) {
//     final newItem = PlagItem(
//       id: DateTime.now().toString(),
//       title: Title,
//       result: Result,
//     );
//     _items.add(newItem);
//     _controllerResult!.text = Title;
//     notifyListeners();
//   }

//   void removeItem(String id) {
//     _items.removeWhere((item) => item.id == id);
//     notifyListeners();
//   }
// }
// //https://plagremoverpro.com/backend/public/api/screen_data/getUniqueData,

import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/plag_item.dart';
import 'package:http/http.dart' as http;

enum SyncResult {
  success,
  failure,
}

class PlagProvider with ChangeNotifier {
  // final DatabaseHelper databaseHelper = DatabaseHelper();

  List<PlagItem> _items = [];
  List<PlagItem> get items {
    return [..._items];
  }

  TextEditingController? _controllerTitle;
  TextEditingController? get controllerTitle => _controllerTitle;
  TextEditingController? _controllerResult;
  TextEditingController? get controllerResult => _controllerResult;

  // PlagProvider() {
  //   instantiateController();
  //   initDatabase();
  // }

  // Future<void> initDatabase() async {
  //   await databaseHelper.initDatabase();
  //   fetchingItemsFromDatabase();
  // }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // Future<void> fetchingItemsFromDatabase() async {
  //   _items = await databaseHelper.getItems();
  //   notifyListeners();
  // }

  void instantiateController() {
    if (_controllerTitle != null) {
      _controllerTitle!.dispose();
    }

    _controllerTitle = TextEditingController();
    _controllerResult = TextEditingController();

    Future.microtask(() {
      notifyListeners();
    });
  }

  void clearControllerTitleText(TextEditingController? controller) {
    controller?.clear();
    notifyListeners();
  }

  Future<void> addItem(
    String title,
    int val,
  ) async {
    final newItem = PlagItem(
      id: DateTime.now().toString(),
      query: title,
    );

    // await databaseHelper.insertItem(
    //   newItem,
    // );
    _items.add(newItem);
    await syncWithServer(newItem, val);
    // _controllerResult!.text = title;
    notifyListeners();

    // Synchronize with the server

    // if (syncResult == SyncResult.success) {
    // Synchronization was successful, proceed to add content to Result
    // if (this.items.isNotEmpty && this.controllerResult!.text.isNotEmpty) {
    //   Result(this.controllerResult!);
    // }
    //print('SyncResult.success is:${SyncResult.success}');
    //} else {
    //  print('Failed syncResult : $syncResult');
    // Show a dialog or handle the failure case
    // showDialog(
    //   // Your dialog configuration here
    //   context: _context!,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Sync Failed'),
    //       content: Text(
    //           'Failed to synchronize with the server. Please try again.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
    // }
  }

  Future<void> syncWithServer(PlagItem item, int value) async {
    final serverUrl =
        'https://plagremoverpro.com/backend/public/api/screen_data/getUniqueData';

    try {
      _isLoading = true;
      notifyListeners();
      print('ture:${_isLoading}');
      final response = await http.post(
        Uri.parse(serverUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'query': item.query,
          'value': value.toString(),
        }),
      );
      print('item.query:${item.query}');
      print('RESPONSE BODY:${response.body}');
      print("value:${value}");
      if (response.statusCode == 200) {
        // Successfully synchronized with the server
        print('Data synchronized with the server');

        // Update the Result with the server response
        //  Result(response.body);
        _controllerResult?.text = json.decode(response.body)['text'];
        print('Controller Result:${_controllerResult?.text}');

        // return SyncResult.success;
      } else if (response.statusCode == 400) {
        print('Failed to synchronize with the server: ${response.statusCode}');
        print('Response body: ${response.body}');

        // return SyncResult.failure;
      } else {
        // Handle the error case
        print('Failed  the server: ${response.statusCode}');
        // print('Response body: ${response.body}');
        // return SyncResult.failure;
      }
    } catch (e) {
      // Handle exceptions, e.g., network errors
      print('Exception during server synchronization: $e');
      // return SyncResult.failure;
    } finally {
      _isLoading = false;
      notifyListeners();
      print('flase:$_isLoading');
    }
  }

  Future<void> removeItem(String id) async {
    // await databaseHelper.deleteItem(id);
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
