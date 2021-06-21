// ignore: prefer_double_quotes
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_controller.dart';
import 'package:raro_parking_challenge/app/controller/parking_history_controller.dart';
import 'package:raro_parking_challenge/app/core/core.dart';
import 'package:raro_parking_challenge/app/pages/entry_detail/entry_detail_page.dart';
import 'package:raro_parking_challenge/app/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  static String _title = 'Controle Estacionamento';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ParkingController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ParkingHistoryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LotController(),
        ),
      ],
      child: MaterialApp(
        theme: AppThemeData.themeData,
        title: _title,
        routes: {
          AppRoutes.HOME: (_) => HomePage(),
          AppRoutes.ENTRY_DETAIL: (_) => EntryDetailPage(),
        },
      ),
    );
  }
}
