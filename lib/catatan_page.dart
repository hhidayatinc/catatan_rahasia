import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatatanRahasia extends StatefulWidget{
  const CatatanRahasia({Key? key}) : super(key: key);
 @override
  
  State<CatatanRahasia> createState() => CatatanRahasiaState();
}

class CatatanRahasiaState extends State<CatatanRahasia>{
   final TextEditingController _catatatanController = TextEditingController();
   final snackBar = const SnackBar(content: Text('Note Saved'));

   Future<void> _loadCatatan() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _catatatanController.text = (prefs.getString('catatan') ?? '');
    });
   }

   Future<void> _addCatatan() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('catatan', _catatatanController.text);
    });
   }

   @override
   void initState(){
    _loadCatatan();
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catatan Rahasia"),),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              maxLines: 10,
              enableSuggestions: false,
              controller: _catatatanController,
              decoration: InputDecoration(
                  labelText: 'Pesan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  _addCatatan();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('Simpan')),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                 Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('Tutup catatan rahasiaku!')),
          )
        ],
      ),
    );
  }
}