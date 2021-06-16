import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/pages/home/home_page.dart';
import 'package:raro_parking_challenge/app/pages/parking_form/parking_form_page.dart';

import 'package:raro_parking_challenge/app/core/app_routes.dart';
import 'package:raro_parking_challenge/app/pages/parking_lots/parking_lot_page.dart';
import 'package:raro_parking_challenge/app/shared/provider/parking_provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ParkingProvider(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.grey[900],
            accentColor: Colors.orange,
            primarySwatch: Colors.orange,
          ),
          title: "Controle Estacionamento",
          routes: {
            AppRoutes.HOME: (_) => HomePage(),
            AppRoutes.PARKING_LOT: (_) => ParkingLotPage(),
          }),
    );
  }
}
