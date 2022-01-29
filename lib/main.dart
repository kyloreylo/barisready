import 'package:barisready/screens/IskeletEkran.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar is Ready',
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: "HouseOfCards"),
      home: IskeletEkran(),
    );
  }
}
