import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '자기소개',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                '1414 이재영',
                style: TextStyle(fontSize: 35),
              )),
              Divider(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const living(),
                        ));
                  },
                  child: Text(
                    '사는곳',
                    style: TextStyle(fontSize: 20),
                  )),
              Divider(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const hobby(),
                        ));
                  },
                  child: Text(
                    '취미',
                    style: TextStyle(fontSize: 20),
                  )),
              Divider(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const one(),
                        ));
                  },
                  child: Text(
                    '한마디',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ));
  }
}

class living extends StatelessWidget {
  const living({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '강원도 양구',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Divider(
              height: 50,
            ),
            Image.asset("assets/img/양구.png"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('돌아가기'))
          ],
        ),
      ),
    );
  }
}

class hobby extends StatelessWidget {
  const hobby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '노래듣기',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Divider(
              height: 50,
            ),
            Image.asset("assets/img/music.png"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('돌아가기'))
          ],
        ),
      ),
    );
  }
}

class one extends StatelessWidget {
  const one({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '앞으로 잘 부탁드립니다 찬홍선배',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              height: 50,
            ),
            Image.asset("assets/img/dochi.png"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('돌아가기'))
          ],
        ),
      ),
    );
  }
}
