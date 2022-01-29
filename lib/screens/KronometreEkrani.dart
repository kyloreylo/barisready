import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class KronometreEkrani extends StatefulWidget {
  @override
  _KronometreEkraniState createState() => _KronometreEkraniState();
}

class _KronometreEkraniState extends State<KronometreEkrani> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  final _scroolController = ScrollController();
  bool _basladiMi = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopWatchTimer.dispose();
    _scroolController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 23, 23, 1),
      appBar: AppBar(
        title: Text("Kronometre"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 235, 221, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder<int>(
                          stream: _stopWatchTimer.rawTime,
                          initialData: _stopWatchTimer.rawTime.value,
                          builder: (context, snapshot) {
                            final value = snapshot.data;
                            final displayTime = StopWatchTimer.getDisplayTime(
                                value,
                                hours: _isHours);
                            return Text(
                              displayTime,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(_basladiMi ? "Tur" : "Sıfırla", () {
                  if (_basladiMi) {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
                  } else {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                  }
                }),
                _buildButton(_basladiMi ? "Durdur" : "Başlat", () {
                  if (_basladiMi) {
                    setState(() {
                      _basladiMi = false;
                    });
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  } else {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    setState(() {
                      _basladiMi = true;
                    });
                  }
                }),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: Color.fromRGBO(238, 235, 221, 1),
                borderRadius: BorderRadius.circular(10)),
            child: StreamBuilder<List<StopWatchRecord>>(
              stream: _stopWatchTimer.records,
              initialData: _stopWatchTimer.records.value,
              builder: (context, snapshot) {
                final value = snapshot.data;
                if (value.isEmpty) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                        child: Text(
                      "Tur Yok",
                      style: TextStyle(fontSize: 30),
                    )),
                  );
                }
                Future.delayed(const Duration(milliseconds: 100), () {
                  _scroolController.animateTo(
                      _scroolController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut);
                });
                return ListView.builder(
                  itemCount: value.length,
                  controller: _scroolController,
                  itemBuilder: (context, index) {
                    final data = value[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tur ${index + 1}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "${data.displayTime}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Function function) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: function,
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(238, 235, 221, 1),
        foregroundColor: Colors.red,
        radius: 45,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
