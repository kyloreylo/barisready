import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  bool _isKgSelected = true;
  bool _isLbSelected = false;
  int bar = 25; //bar
  double sonuc, agirlik = 0, takilacak_agirlik; //variables
  int kirmizi = 0,
      mavi = 0,
      sari = 0,
      yesil = 0,
      beyaz = 0,
      siyah = 0,
      gri = 0; //plates
  void _calculateWeigth(double agirlik) {
    takilacak_agirlik = (agirlik - bar) / 2;

    //print(takilacak_agirlik);
    setState(() {
      kirmizi = (takilacak_agirlik / 25.0).toInt();
      sonuc = takilacak_agirlik - (kirmizi * 25);
      takilacak_agirlik = sonuc;
    });
    //print("Kirmizi : $kirmizi");
    //print(sonuc);
    setState(() {
      mavi = (takilacak_agirlik / 20).toInt();
      sonuc = takilacak_agirlik - (mavi * 20);
      takilacak_agirlik = sonuc;
    });
    //print("Mavi : $mavi");
    //print(sonuc);
    setState(() {
      sari = (takilacak_agirlik / 15).toInt();
      sonuc = takilacak_agirlik - (sari * 15);
      takilacak_agirlik = sonuc;
    });
    //print("Sari : $sari");
    //print(sonuc);
    setState(() {
      yesil = (takilacak_agirlik / 10).toInt();
      sonuc = takilacak_agirlik - (yesil * 10);
      takilacak_agirlik = sonuc;
    });
    //print("Yeşil : $yesil");
    //print(sonuc);
    setState(() {
      beyaz = (takilacak_agirlik / 5).toInt();
      sonuc = takilacak_agirlik - (beyaz * 5);
      takilacak_agirlik = sonuc;
    });
    //print("Beyaz : $beyaz");
    //print(sonuc);
    setState(() {
      siyah = (takilacak_agirlik / 2.5).toInt();
      sonuc = takilacak_agirlik - (siyah * 2.5);
      takilacak_agirlik = sonuc;
    });
    //print("Siyah : $siyah");
    //print(sonuc);
    setState(() {
      gri = (takilacak_agirlik / 1.25).toInt();
      sonuc = takilacak_agirlik - (gri * 1.25);
      takilacak_agirlik = sonuc;
    });
    //print("Gri : $gri");
    //print(sonuc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text(
          'Bar is Ready',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: "HouseOfCards"),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(206, 18, 18, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                _buildTheBar(),
                _buildKgLbButtons(),
                _buildWeigthText(),
                _buildWeigthTextField(),
                agirlik > 600 ? _buildErrorMessage() : SizedBox(),
                _buildPlateResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _neededPlatesBuild(int plakaRenk, Color renk, double height) {
    return Column(
      children: [
        _buildPlates(height, "", renk),
        Text(
          plakaRenk.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _platesInfo(Color color, String text) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          color: color,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }

  Widget _neededPlates() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _neededPlatesBuild(kirmizi, Colors.red, 65),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        _neededPlatesBuild(mavi, Colors.blue, 65),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        _neededPlatesBuild(sari, Colors.yellow, 55),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        _neededPlatesBuild(yesil, Colors.green, 50),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        _neededPlatesBuild(beyaz, Colors.white, 40),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        _neededPlatesBuild(siyah, Colors.black, 30),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        _neededPlatesBuild(gri, Colors.grey, 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _platesInfo(Colors.red, "25 KG|55 LB"),
            _platesInfo(Colors.blue, "20 KG|44 LB"),
            _platesInfo(Colors.yellow, "15 KG|33 LB"),
            _platesInfo(Colors.green, "10 KG|22 LB"),
            _platesInfo(Colors.white, "5 KG|11 LB"),
            _platesInfo(Colors.black87, "2.5 KG|5.5 LB"),
            _platesInfo(Colors.grey, "1.25 KG|2.75 LB"),
          ],
        ),
      ],
    );
  }

  Widget _buildPlates(double height, String text, Color color) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color == Colors.black ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBar(double width, double height, double radius, var color) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius)),
            color: color),
      ),
    );
  }

  Widget _buildTheBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      height: MediaQuery.of(context).size.height * 0.3,
      // color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBar(70, 8, 0, Colors.grey[350]),
          _buildBar(10, 25, 3, Colors.grey),
          for (int i = 1; i <= kirmizi; i++)
            _buildPlates(150, "25", Colors.red),
          for (int i = 1; i <= mavi; i++) _buildPlates(150, "20", Colors.blue),
          for (int i = 1; i <= sari; i++)
            _buildPlates(140, "15", Colors.yellow),
          for (int i = 1; i <= yesil; i++)
            _buildPlates(130, "10", Colors.green),
          for (int i = 1; i <= beyaz; i++) _buildPlates(110, "5", Colors.white),
          for (int i = 1; i <= siyah; i++)
            _buildPlates(90, "2.50", Colors.black),
          for (int i = 1; i <= gri; i++) _buildPlates(70, "1.25", Colors.grey),
          _buildBar(15, 30, 3, Colors.grey),
          _buildBar(100, 15, 3, Colors.grey[350]),
        ],
      ),
    );
  }

  Widget _buildKgLbButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.50,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black45,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isKgSelected = true;
                      _isLbSelected = false;
                    });
                    print("kg seçildi");
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.24,
                    decoration: BoxDecoration(
                      color: _isKgSelected
                          ? Colors.redAccent[700]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "KG",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("lb seçildi");
                    setState(() {
                      _isLbSelected = true;
                      _isKgSelected = false;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.24,
                    decoration: BoxDecoration(
                      color: _isLbSelected
                          ? Colors.redAccent[700]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "LB",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWeigthText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            agirlik < 25
                ? "20 KG | 44 LB" ?? agirlik <= 600
                : "$agirlik KG | ${(agirlik * 2.205).ceil()} LB",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeigthTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 130,
            decoration: BoxDecoration(
              color: Color.fromRGBO(238, 235, 221, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              cursorColor: Colors.red,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Ağırlık",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    agirlik = double.parse(value);
                    if (agirlik > 25 && agirlik <= 600) {
                      _calculateWeigth(agirlik);
                    } else {
                      print("Boş Bar");
                    }
                  });
                } else {
                  setState(() {
                    kirmizi = 0;
                    mavi = 0;
                    sari = 0;
                    yesil = 0;
                    beyaz = 0;
                    siyah = 0;
                    gri = 0;
                  });
                }
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Text(
            _isKgSelected ? "KG" : "LB",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
        children: const [
          Text(
            'Too many Plates! \nMax 600 KG / 1323 LB',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )
    ]);
  }

  Widget _buildPlateResult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 3),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const Text(
                'Takılacak Ağırlıklar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              _neededPlates(),
              const SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
