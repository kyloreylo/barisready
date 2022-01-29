import 'package:barisready/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class YagOraniHesapla extends StatefulWidget {
  @override
  _YagOraniHesaplaState createState() => _YagOraniHesaplaState();
}

class _YagOraniHesaplaState extends State<YagOraniHesapla> {
  double _kg = 0, _boy = 0, _sonuc = 0, _vki, _yas = 10;
  String _vucutKategori, _vkiPuanText;
  bool _kgKontrol = false, _boyKontrol = false;
  String _selectedGender = "1";
  void _vkiHesapla() {
    _vki = ((_kg / (_boy * _boy)) * 10000);
    setState(() {
      _vkiPuanText = _vki.toStringAsFixed(2);
    });

    setState(() {
      _sonuc = (1.20 * _vki) +
          (0.16 * _yas) -
          (10.34 * int.parse(_selectedGender)) -
          9;
    });
    if (_selectedGender == "1") {
      if (_sonuc >= 6 && _sonuc <= 13) {
        setState(() {
          _vucutKategori = "Sporcu";
        });
      } else if (_sonuc >= 14 && _sonuc <= 17) {
        setState(() {
          _vucutKategori = "Fit";
        });
      } else if (_sonuc >= 18 && _sonuc <= 24) {
        setState(() {
          _vucutKategori = "Ortalama";
        });
      } else if (_sonuc >= 25) {
        setState(() {
          _vucutKategori = "Çok Yağlı";
        });
      }
    } else if (_selectedGender == "0") {
      if (_sonuc >= 14 && _sonuc <= 20) {
        setState(() {
          _vucutKategori = "Sporcu";
        });
      } else if (_sonuc >= 21 && _sonuc <= 24) {
        setState(() {
          _vucutKategori = "Fit";
        });
      } else if (_sonuc >= 25 && _sonuc <= 31) {
        setState(() {
          _vucutKategori = "Ortalama";
        });
      } else if (_sonuc >= 32) {
        setState(() {
          _vucutKategori = "Çok Yağlı";
        });
      }
    }
    print(_vki);
    print(_vkiPuanText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text("Yağ Oranı Hesapla"),
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _sonuc != 0
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
                                    TextSpan(text: 'Yağ Oranı : '),
                                    TextSpan(
                                      text: "%${_sonuc.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
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
                      : Text(''),
                ],
              ),
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "1",
                          groupValue: _selectedGender,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                        Text(
                          'Erkek',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "0",
                          activeColor: Colors.red,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                              print(_selectedGender);
                            });
                          },
                        ),
                        Text('Kadın', style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ],
                ),
              ),
              CustomTextField(
                errorText: "Boy değeri 140-250 arasında olmalıdır",
                hintText: "Boyunuzu Giriniz",
                suffixText: "cm",
                labelText: "Boy",
                kontrol: _boyKontrol,
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
                  }
                },
              ),
              CustomTextField(
                errorText: "Kilogram değeri 30-250 arasında olmalıdır",
                hintText: "Kilonuzu Giriniz",
                suffixText: "kg",
                labelText: "Kilo",
                kontrol: _boyKontrol,
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
                  }
                },
              ),
              CustomTextField(
                errorText: "Yaş değeri 10'dan büyük olmalıdır.",
                hintText: "Yaşınızı Giriniz",
                suffixText: "",
                labelText: "Yaş",
                kontrol: _boyKontrol,
                metot: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      _yas = double.parse(val);
                    });
                  }
                },
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
      ),
    );
  }
}
