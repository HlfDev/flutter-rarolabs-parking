import 'package:flutter/material.dart';

import 'package:raro_parking_challenge/app/pages/parking/parking_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String _title = 'Controle Estacionamento';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_title),
        ),
        body: ParkingPage(),
      ),
    );
  }
}
