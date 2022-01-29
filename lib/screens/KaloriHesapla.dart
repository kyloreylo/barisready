import 'package:barisready/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class KaloriHesapla extends StatefulWidget {
  @override
  _KaloriHesaplaState createState() => _KaloriHesaplaState();
}

class _KaloriHesaplaState extends State<KaloriHesapla> {
  // List of items in our dropdown menu
  List<String> items = [
    'Hareketsiz',
    'Biraz Aktif',
    'Az Hareketli (Haftada 3-4 gün antrenman)',
    'Hareketli (Haftada 5-7 gün antrenman)',
    'Yoğun iş, Profesyonel seviye',
  ];
  String dropdownvalue = "Hareketsiz";
  double _yagOrani, _kg, _aktivite = 0;
  double _bmr = 0, _kalori;
  void _hesapla() {
    setState(() {
      _bmr = 370 + (21.6 * (_kg - (_kg * _yagOrani / 100)));
    });

    print(_bmr);
    print(dropdownvalue);
    print(items[0]);
    if (dropdownvalue == items[0]) {
      setState(() {
        _aktivite = 350;
      });
    } else if (dropdownvalue == items[1]) {
      setState(() {
        _aktivite = 700;
      });
    } else if (dropdownvalue == items[2]) {
      setState(() {
        _aktivite = 1050;
      });
    } else if (dropdownvalue == items[3]) {
      setState(() {
        _aktivite = 1350;
      });
    } else if (dropdownvalue == items[4]) {
      setState(() {
        _aktivite = 1700;
      });
    }
    print(_aktivite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text("Kalori Hesapla"),
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
                _bmr != 0
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
                                  TextSpan(text: "BMR Değeri : "),
                                  TextSpan(
                                      text: "${_bmr.toStringAsFixed(0)} kcal",
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
                                  TextSpan(text: 'Kalori İhtiyacı : '),
                                  TextSpan(
                                    text:
                                        "${(_bmr + _aktivite).toStringAsFixed(0)} kcal",
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
                    _yagOrani = double.parse(val);
                  });
                } else {
                  setState(() {
                    _bmr = 0;
                    _yagOrani = 0;
                  });
                }
              },
              suffixText: "%",
              labelText: "Yağ",
              errorText: "Yağ Oranı 4'ten büyük olmalıdır.",
              hintText: "Yağ Oranı Giriniz",
              kontrol: false,
            ),
            CustomTextField(
              metot: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    _kg = double.parse(val);
                  });
                } else {
                  setState(() {
                    _bmr = 0;
                    _kg = 0;
                  });
                }
              },
              suffixText: "kg",
              labelText: "Kilo",
              errorText: "Kilogram değeri 30-250 arasında olmalıdır.",
              hintText: "Kilonuzu Giriniz",
              kontrol: false,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(10),
              child: DropdownButton(
                dropdownColor: Colors.red,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "HouseOfCards",
                    fontSize: 16),
                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                isExpanded: true,
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
              ),
            ),
            MaterialButton(
              onPressed: () {
                _hesapla();
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
