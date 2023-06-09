import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postflutter/screen/listPage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future updateServer(String name) async {
  var response = await http.patch(Uri.parse('http://192.168.1.76:8080/post'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"name": name}));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
}

Future delServer(String userid) async {
  var response = await http.delete(
      Uri.parse('http://192.168.1.76:8080/delete?id=$userid'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"user_id": userid}));

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
}

Future postServer(String userid, String birthday, String name) async {
  var response = await http.post(
    Uri.parse('http://192.168.1.76:8080/post'),
    headers: {'Content-Type': 'application/json'}, //필수
    body: jsonEncode({"user_id": userid, "name": name, "birthday": birthday}),
  );

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
}

class _HomePageState extends State<HomePage> {
  late TextEditingController useridText;
  late TextEditingController birthdayText;
  late TextEditingController nameText;

  @override
  void initState() {
    super.initState();
    useridText = TextEditingController();
    birthdayText = TextEditingController();
    nameText = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Flutter")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'User_ID',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                controller: useridText,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'BirthDay',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                controller: birthdayText,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                controller: nameText,
              ),
            ),
            MaterialButton(
              child: const Text('List Page'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListPage(),
                    ));
              },
            ),
            const SizedBox(height: 250),
            MaterialButton(
              child: const Text('Post Server'),
              onPressed: () {
                postServer(useridText.text, birthdayText.text, nameText.text);
              },
            ),
            MaterialButton(
              child: const Text('Del UserID'),
              onPressed: () {
                delServer(useridText.text);
              },
            ),
            MaterialButton(
              child: const Text('Update Name'),
              onPressed: () {
                updateServer(nameText.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
