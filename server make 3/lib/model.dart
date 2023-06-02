class Test {
  String? login;
  String? avatarUrl;
  String? htmlUrl;
  String? type;

  Test({this.login, this.avatarUrl, this.htmlUrl, this.type});

  Test.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['html_url'] = this.htmlUrl;
    data['type'] = this.type;
    return data;
  }
}

class TestList {
  //class 생성
  final List<Test>? tests; //tests라는 List 생성
  TestList({this.tests}); //생성자로 TestList에 받기
  factory TestList.fromJson(List<dynamic> json) {
    //factory
    List<Test> tests = <Test>[];
    tests = json.map((i) => Test.fromJson(i)).toList();

    return TestList(
      tests: tests,
    );
  }
}
