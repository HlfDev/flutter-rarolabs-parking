import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/pages/home/widgets/form/form_homepage3_widget.dart';
import 'package:raro_parking_challenge/app/pages/home/widgets/form/form_homepage_widget.dart';
import 'package:raro_parking_challenge/app/pages/parking/widgets/tile/parking_tile.dart';
import 'package:raro_parking_challenge/app/shared/provider/parking_provider.dart';

class HomePage extends StatelessWidget {
  static String _title = 'Controle Estacionamento';
  static List _tabTitle = ['Vagas', 'Entradas', 'Saídas'];
  static Icon _iconTabOne = Icon(Icons.local_parking);
  static Icon _iconTabTwo = Icon(Icons.garage);
  static Icon _iconTabThree = Icon(Icons.history);
  @override
  Widget build(BuildContext context) {
    final ParkingProvider parkingList = Provider.of(
      context,
      listen: true,
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 10,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: _tabTitle[0],
                icon: _iconTabOne,
              ),
              Tab(
                text: _tabTitle[1],
                icon: _iconTabTwo,
              ),
              Tab(
                text: _tabTitle[2],
                icon: _iconTabThree,
              ),
            ],
          ),
          centerTitle: true,
          title: Text(_title),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FormHomePage3Widget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FormHomePageWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: parkingList.count,
                      itemBuilder: (BuildContext context, index) =>
                          ParkingTileWidget(
                        parkingModel: parkingList.byIndex(index),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(),
          ],
        ),
        //ParkingPage(),
      ),
    );
  }
}
