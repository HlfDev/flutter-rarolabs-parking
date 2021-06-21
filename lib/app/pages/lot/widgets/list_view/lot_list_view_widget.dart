import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/controller/lot_controller.dart';
import 'package:raro_parking_challenge/app/pages/lot/widgets/tile/lot_tile_widget.dart';

class LotListView extends StatelessWidget {
  const LotListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LotController>(builder: (_, lotController, __) {
      final lotList = lotController.items;
      return ListView.builder(
        reverse: false,
        itemCount: lotList.length,
        itemBuilder: (BuildContext context, index) => LotTileWidget(
          lotModel: lotList.elementAt(index),
        ),
      );
    });
  }
}
