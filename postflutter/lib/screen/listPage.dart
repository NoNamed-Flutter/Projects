import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postflutter/model.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

Future<ModelList> getList() async {
  var url = 'http://192.168.1.76:8080/get';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return ModelList.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('No Server Response');
  }
}

class _ListPageState extends State<ListPage> {
  Future<ModelList>? model;

  @override
  void initState() {
    super.initState();
    model = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: FutureBuilder(
        future: model,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.datas!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                        '${snapshot.data!.datas![index].userId.toString()} ${snapshot.data!.datas![index].name.toString()}'),
                    subtitle:
                        Text(snapshot.data!.datas![index].birthday.toString()),
                    isThreeLine: true,
                    dense: true,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
