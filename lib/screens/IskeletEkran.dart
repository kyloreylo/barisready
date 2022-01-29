import 'package:barisready/screens/PlakaEkrani.dart';
import 'package:barisready/screens/AyarlarEkrani.dart';
import 'package:barisready/screens/HesaplamaEkrani.dart';
import 'package:barisready/screens/KronometreEkrani.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IskeletEkran extends StatefulWidget {
  @override
  _IskeletEkranState createState() => _IskeletEkranState();
}

class _IskeletEkranState extends State<IskeletEkran> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
    });
  }

  Widget sayfaGoster(int seciliSayfa) {
    if (seciliSayfa == 0) return AnaEkran();
    if (seciliSayfa == 1) return HesaplamaEkrani();
    if (seciliSayfa == 2) return KronometreEkrani();
    if (seciliSayfa == 3) return AyarlarEkrani();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaGoster(seciliSayfa),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(27, 23, 23, 1),
        child: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Color.fromRGBO(206, 18, 18, 1)),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              currentIndex: seciliSayfa,
              onTap: sayfaDegistir,
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.dumbbell),
                  title: Text(
                    'Anasayfa',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.calculator),
                  title: Text(
                    'Hesaplayıcılar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.stopwatch),
                  title: Text(
                    'Kronometre',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.cog),
                  title: Text(
                    'Ayarlar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
