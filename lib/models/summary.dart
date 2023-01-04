class summary {
  String? ti;
  String? text;
  // String? cr;
  summary();
  Map<String, dynamic> fromJson() => {'summary': text, 'title': ti};
  summary.fromSnapshot(snapshot)
      : text = snapshot.data()['summary'],
        // cr = snapshot.data()['created'],
        ti = snapshot.data()['title'];
}
