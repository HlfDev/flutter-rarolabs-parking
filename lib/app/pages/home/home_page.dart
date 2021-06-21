import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_history_controller.dart';
import 'package:raro_parking_challenge/app/pages/departure/departure_page.dart';
import 'package:raro_parking_challenge/app/pages/entry/entry_page.dart';

import 'package:raro_parking_challenge/app/pages/lot/lot_page.dart';

class HomePage extends StatefulWidget {
  static String _title = 'Controle Estacionamento';
  static List _tabTitle = ['Vagas', 'Entradas', 'Saídas'];

  static List<Icon> _icons = [
    Icon(Icons.local_parking),
    Icon(Icons.garage),
    Icon(Icons.logout),
  ];
  static List<Widget> _pages = [
    LotPage(),
    EntryPage(),
    DeparturePage(),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ParkingController>(context, listen: false).fetch();
    Provider.of<ParkingHistoryController>(context, listen: false).fetch();
    Provider.of<LotController>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 10,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: HomePage._tabTitle[0], icon: HomePage._icons[0]),
              Tab(text: HomePage._tabTitle[1], icon: HomePage._icons[1]),
              Tab(text: HomePage._tabTitle[2], icon: HomePage._icons[2]),
            ],
          ),
          centerTitle: true,
          title: Text(HomePage._title),
        ),
        body: TabBarView(
          children: [
            HomePage._pages[0],
            HomePage._pages[1],
            HomePage._pages[2],
          ],
        ),
      ),
    );
  }
}
