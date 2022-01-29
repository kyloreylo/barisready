import 'package:flutter/material.dart';

class AyarlarEkrani extends StatefulWidget {
  @override
  _AyarlarEkraniState createState() => _AyarlarEkraniState();
}

class _AyarlarEkraniState extends State<AyarlarEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text("Ayarlar"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
