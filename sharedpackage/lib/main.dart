import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _id = '';
  String _pw = '';
  SharedPreferences? _prefs; //내부 저장소에 저장되어있는 값을 불러오기 위한 변수

  final idController = TextEditingController(); //TextField에 값을 받아오기 위한 변수1
  final pwController = TextEditingController(); //TextField에 값을 받아오기 위한 변수2

  @override
  void initState() {
    //시작될때 한번만 load
    super.initState();
    _loadId(); //시작하고 _loadId함수를 불러온다
  }

  _loadId() async {
    //_loadId함수(비동기)
    _prefs = await SharedPreferences
        .getInstance(); // 캐시에 저장되어있는 값을 불러온다.(불러 올때까지 대기)
    setState(() {
      // 캐시에 저장된 값을 반영하여 현재 상태를 설정한다.
      // SharedPreferences에 id, pw로 저장된 값을 읽어 필드에 저장. 없을 경우 0으로 대입
      _id = (_prefs!.getString('id') ?? '');
      _pw = (_prefs!.getString('pw') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('shared_preference')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 30, 16, 0),
            child: TextField(
              controller: idController, // 여기서 입력받은 String값을 idController에 전달
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelTex  t: "ID",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: TextField(
              controller: pwController, // 여기서 입력받은 String값을 pwController에 전달
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "PW",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 40),
            child: FloatingActionButton(
              child: const Icon(Icons.account_box),
              onPressed: () {
                _id = idController.text; // _id 에 입력받은 값 넣어줌
                _pw = pwController.text; // _pw 에 입력받은 값 넣어줌
                _prefs!.setString(
                    'id', _id); // 내부 저장소에서 id를 키로 가지고 있는 값에 입력받은 _id를 넣어줌.
                _prefs!.setString(
                    'pw', _pw); // 내부 저장소에서 pw를 키로 가지고 있는 값에 입력받은 _pw를 넣어줌.

                showDialog(
                  // 버튼을 눌렀음을 확인시키기 위한 창 띄우기
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text(
                        '저장이 완료됐습니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Text('아이디: $_id',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              )), // 어플을 재시작해도 데이터가 보존되는지 확인하기 위한 Text창
          Text('비밀번호: $_pw',
              style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
