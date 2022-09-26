import 'package:evaluasi_tsa/catatan_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController? pin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: pin,
              decoration: InputDecoration(
                  labelText: 'PIN',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CatatanRahasia()));
                },
                child: Text('Buka')),
          )
        ],
      ),
    );
  }
}
