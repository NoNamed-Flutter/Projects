import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MemoPage(),
    );
  }
}

class MemoPage extends StatefulWidget {
  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  TextEditingController _textController = TextEditingController();

  String _memo = ""; //메모 보여주는 곳

  SharedPreferences? _prefs; //메모 저장하는 곳

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      //객체를 돌려쓰기?
      setState(() {
        _prefs = value;
      });
      String? memo = _prefs?.getString("memo");
      if (memo != null) {
        setState(() {
          _memo = memo;
          _textController.text = memo;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메모 앱"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "메모를 입력하세요",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _memo = _textController.text;
                });
                await _prefs?.setString("memo", _memo);
              },
              child: Text("저장하기"),
            ),
            SizedBox(height: 16.0),
            Text("저장된 메모:\n$_memo"),
          ],
        ),
      ),
    );
  }
}
