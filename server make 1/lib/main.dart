import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class Test {
  int? userId;
  int? id;
  String? title;

  Test({
    this.userId,
    this.id,
    this.title,
  });

  Test.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

Future<Test> asd() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

  if (response.statusCode == 200) {
    return Test.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("값을 못가져옴");
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Test>? test;

  @override
  void initState() {
    //initState는 한번만 선언되는 메서드 이다
    super.initState();
    test = asd(); // asd 함수를 호출하여 데이터를 가져와서 test 변수에 할당
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: test, // 비동기 작업을 수행하는 Future 객체
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // 데이터가 있는 경우
              return Text(snapshot.data!.userId.toString()); // 사용자 ID를 텍스트로 표시
            } else if (snapshot.hasError) {
              // 에러가 있는 경우
              return Text(snapshot.error.toString()); // 에러 메시지를 텍스트로 표시
            } else {
              // 데이터 로딩 중인 경우
              return const CircularProgressIndicator(); // 로딩 인디케이터 표시
            }
          },
        ),
      ),
    );
  }
}
