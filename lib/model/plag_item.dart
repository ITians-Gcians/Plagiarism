// class PlagItem {
//   String id;
//   String title;

//   String result;

//   PlagItem({required this.id, required this.title, required this.result});

// }
class PlagItem {
  String id;
  String query;
  //String result;

  PlagItem({
    required this.id,
    required this.query,
    // required this.result,
  });

  // Convert PlagItem to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': query,
      // 'result': result,
    };
  }
}
