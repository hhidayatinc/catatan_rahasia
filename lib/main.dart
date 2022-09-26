import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:evaluasi_tsa/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30.0,
        fontFamily: 'SF',
        color: Colors.blue
      ),
      child: Center(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText('Catatan Rahasia'
                ,speed: Duration(milliseconds: 100)),
          ],
        ),
      ),
    ),
    SizedBox(height: 10,),
    ElevatedButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }, child: const Text("Next"))
      ],
    )
  );
  }
}
