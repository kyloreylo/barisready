import 'package:barisready/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class IdealKiloHesapla extends StatefulWidget {
  @override
  _IdealKiloHesaplaState createState() => _IdealKiloHesaplaState();
}

class _IdealKiloHesaplaState extends State<IdealKiloHesapla> {
  double _kg = 0, _boy = 0, _sonuc = 0, _vki = 0;
  String _vucutKategori, _vkiPuanText;
  bool _kgKontrol = false, _boyKontrol = false;
  void _vkiHesapla() {
    _vki = ((_kg / (_boy * _boy)) * 10000);
    setState(() {
      _vkiPuanText = _vki.toStringAsFixed(2);
    });
    if (double.parse(_vkiPuanText) >= 0 && double.parse(_vkiPuanText) <= 18.4) {
      setState(() {
        _vucutKategori = "Zayıf Değer";
      });
    } else if (double.parse(_vkiPuanText) >= 18.5 &&
        double.parse(_vkiPuanText) <= 24.9) {
      setState(() {
        _vucutKategori = "Normal Değer";
      });
    } else if (double.parse(_vkiPuanText) >= 25 &&
        double.parse(_vkiPuanText) <= 29.9) {
      setState(() {
        _vucutKategori = "Fazla Kilolu";
      });
    } else if (double.parse(_vkiPuanText) >= 30 &&
        double.parse(_vkiPuanText) <= 34.9) {
      setState(() {
        _vucutKategori = "Şişman (Obez) 1. Sınıf";
      });
    } else if (double.parse(_vkiPuanText) >= 35 &&
        double.parse(_vkiPuanText) <= 44.9) {
      setState(() {
        _vucutKategori = "Şişman (Obez) 2. Sınıf";
      });
    } else {
      setState(() {
        _vucutKategori = "Aşırı Obez";
      });
    }

    print(_vki);
    print(_vkiPuanText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text("BMI Hesapla"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _vki != 0
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'HouseOfCards',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(text: "BMI Değeri : "),
                                  TextSpan(
                                      text: _vkiPuanText,
                                      style: TextStyle(color: Colors.red))
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'HouseOfCards',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(text: 'Vücut Kategorisi : '),
                                  TextSpan(
                                    text: _vucutKategori,
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            CustomTextField(
              metot: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    _boy = double.parse(val);
                    if (_boy > 250 || _boy < 140) {
                      _boyKontrol = true;
                    } else if (val.isEmpty) {
                      _boyKontrol = false;
                    } else {
                      _boyKontrol = false;
                    }

                    print(_boy);
                  });
                } else {
                  setState(() {
                    _vki = 0;
                    _boy = 0;
                  });
                }
              },
              suffixText: "cm",
              labelText: "Boy",
              errorText: "Boy değeri 140-250 arasında olmalıdır",
              hintText: "Boyunuzu Giriniz",
              kontrol: _boyKontrol,
            ),
            CustomTextField(
              metot: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    _kg = double.parse(val);

                    if (_kg > 250 || _kg < 40) {
                      _kgKontrol = true;
                    } else if (val.isEmpty) {
                      _kgKontrol = false;
                    } else {
                      _kgKontrol = false;
                    }

                    print(_kg);
                  });
                } else {
                  setState(() {
                    _vki = 0;
                    _kg = 0;
                  });
                }
              },
              suffixText: "kg",
              labelText: "Kilo",
              errorText: "Kilogram değeri 30-250 arasında olmalıdır.",
              hintText: "Kilonuzu Giriniz",
              kontrol: _kgKontrol,
            ),
            MaterialButton(
              onPressed: () {
                if (_boy != 0 && _kg != 0) {
                  _boyKontrol = false;
                  _kgKontrol = false;
                  _vkiHesapla();
                } else {
                  setState(() {
                    _boyKontrol = true;
                    _kgKontrol = true;
                  });
                }
              },
              child: Text('Hesapla'),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
