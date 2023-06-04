import 'package:flutter/material.dart';

void main() => const MyApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

final List<String> texts = [
  'Page1',
  'Page2',
  'Page3',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: texts.length),
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              '${texts[index]}',
              style: TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );
  }
}
