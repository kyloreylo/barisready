import 'package:barisready/screens/IdealKiloEkrani.dart';
import 'package:barisready/screens/KaloriHesapla.dart';
import 'package:barisready/screens/YagOraniEkrani.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class HesaplamaEkrani extends StatefulWidget {
  @override
  _HesaplamaEkraniState createState() => _HesaplamaEkraniState();
}

class _HesaplamaEkraniState extends State<HesaplamaEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(206, 18, 18, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buttonContainer(
                MediaQuery.of(context).size.width * 0.6,
                MediaQuery.of(context).size.height * 0.2,
                FontAwesomeIcons.weight,
                "İdeal Kilo",
                () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: IdealKiloHesapla(),
                          type: PageTransitionType.rightToLeftWithFade));
                },
              ),
              _buttonContainer(
                MediaQuery.of(context).size.width * 0.6,
                MediaQuery.of(context).size.height * 0.2,
                FontAwesomeIcons.dumbbell,
                "1RM Hesapla",
                () {},
              ),
              _buttonContainer(
                MediaQuery.of(context).size.width * 0.6,
                MediaQuery.of(context).size.height * 0.2,
                FontAwesomeIcons.percentage,
                "Yağ Oranı",
                () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: YagOraniHesapla(),
                      type: PageTransitionType.rightToLeftWithFade,
                    ),
                  );
                },
              ),
              _buttonContainer(
                MediaQuery.of(context).size.width * 0.6,
                MediaQuery.of(context).size.height * 0.2,
                FontAwesomeIcons.appleAlt,
                "Kalori",
                () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: KaloriHesapla(),
                          type: PageTransitionType.rightToLeftWithFade));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonContainer(
      double width, double heigth, IconData icon, String text, Function metot) {
    return InkWell(
      onTap: metot,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(238, 235, 221, 1),
          ),
          height: heigth,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
