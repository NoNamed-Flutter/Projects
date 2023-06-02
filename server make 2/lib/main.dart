import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:server2/model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

Future<TestList> getList() async {
  var url = 'https://jsonplaceholder.typicode.com/albums';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return TestList.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception("No Data");
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<TestList>? model;

  @override
  void initState() {
    super.initState();
    model = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Server List'),
      ),
      body: Center(
        child: FutureBuilder(
          future: model,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.tests!.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data!.tests![index].title.toString());
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
