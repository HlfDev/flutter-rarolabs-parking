import 'package:flutter/material.dart';

import 'package:raro_parking_challenge/app/pages/history/history_page.dart';
import 'package:raro_parking_challenge/app/pages/settings/settings_page.dart';
import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';

class ParkingLotPage extends StatelessWidget {
  const ParkingLotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parkingModel =
        ModalRoute.of(context)!.settings.arguments as ParkingModel;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${parkingModel.parkingName}'),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.of(context)
          //           .pushNamed(AppRoutes.PARKING_FORM, arguments: parkingModel);
          //     },
          //     icon: Icon(
          //       Icons.edit,
          //       color: Colors.white,
          //     ),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) => AlertDialog(
          //           title: Text('Excluir Estacionamento'),
          //           content: Text('Tem certeza?'),
          //           actions: [
          //             OutlinedButton(
          //               onPressed: () {
          //                 Navigator.of(context).pop(false);
          //               },
          //               child: Text('Não'),
          //             ),
          //             OutlinedButton(
          //               onPressed: () {
          //                 Navigator.of(context).pop(true);
          //               },
          //               child: Text('Sim'),
          //             ),
          //           ],
          //         ),
          //       ).then((confirmed) {
          //         if (confirmed) {
          //           Provider.of<ParkingProvider>(context, listen: false)
          //               .remove(parkingModel);
          //         }
          //       });
          //     },
          //     icon: Icon(
          //       Icons.delete,
          //       color: Colors.white,
          //     ),
          //   ),
          // ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.garage)),
              Tab(icon: Icon(Icons.history)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(),
            HistoryPage(),
            SettingsPage(
              parkingModel: parkingModel,
            ),
          ],
        ),
      ),
    );
  }
}
