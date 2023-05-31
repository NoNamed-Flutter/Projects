import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool switchValue = false;
  int _cnt = 0;

  final List _color = [
    0xFFFFFFFF,
    0xFF7e7ac7,
  ];

  final List<bool> _cupertinoswitch = [
    false,
    true,
  ];

  final List<String> _maintext = [
    'HTTPS 보호가 비활성 상태 입니다',
    'HTTPS 접속이 안전하게 보호됩니다',
  ];

  final List<String> _subtext = [
    '버튼을 눌러 HTTPS 접속을 보호하세요',
    '버튼을 누르면 HTTPS 보호가 해제됩니다',
  ];

  final List<dynamic> _img = [
    Image.asset(
      "assets/img/offbutton.png",
      height: 260,
    ),
    Image.asset(
      "assets/img/onbutton.png",
      height: 260,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1e1d2d),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 72, 0, 180),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/unicon2.png',
                    width: 26,
                  ),
                  Text(
                    '  유니콘 HTTPS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: _img[_cnt],
                    onTap: () {
                      setState(() {
                        _cnt ^= 1; //^=는 XOR연산자로 1이면 0으로 0이면 1로 변환
                      });
                    },
                  ),
                ]),
            SizedBox(
              height: 50, //빈공간은 만들기 위한 박스
            ),
            CupertinoSwitch(
              activeColor: Color(0xFF37355c),
              trackColor: Color(0xFF171522),
              thumbColor: Color(_color[_cnt]),
              value: _cupertinoswitch[_cnt],
              onChanged: (value) {
                setState(() {
                  _cnt ^= 1;
                });
              },
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              _maintext[_cnt],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _subtext[_cnt],
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666587),
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/img/background.png",
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/img/menubutton.png",
                      height: 60,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
