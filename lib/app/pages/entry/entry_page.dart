import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/pages/entry/widgets/form/entry_form_widget.dart';
import 'package:raro_parking_challenge/app/pages/entry/widgets/tile/entry_tile_widget.dart';
import 'package:raro_parking_challenge/app/provider/parking_provider.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ParkingProvider parkingList = Provider.of(
      context,
      listen: true,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          EntryFormWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: parkingList.count,
              itemBuilder: (BuildContext context, index) => EntryTileWidget(
                parkingModel: parkingList.byIndex(index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
