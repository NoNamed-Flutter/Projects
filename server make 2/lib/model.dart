class Test {
  int? id;
  int? userId;
  String? title;

  Test({this.id, this.userId, this.title});

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usetId'] = this.userId;
    data['title'] = this.title;
    return data;
  }
}

class TestList {
  final List<Test>? tests;
  TestList({this.tests});
  factory TestList.fromJson(List<dynamic> json) {
    List<Test> tests = <Test>[];
    tests = json.map((i) => Test.fromJson(i)).toList();

    return TestList(
      tests: tests,
    );
  }
}
