import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/pages/lot/widgets/form/lot_form_widget.dart';
import 'package:raro_parking_challenge/app/pages/lot/widgets/tile/lot_tile_widget.dart';
import 'package:raro_parking_challenge/app/provider/lot_provider.dart';

class LotPage extends StatelessWidget {
  const LotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LotProvider lotList = Provider.of(
      context,
      listen: true,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          LotFormWidget(),
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: lotList.count,
              itemBuilder: (BuildContext context, index) => LotTileWidget(
                lotModel: lotList.byIndex(index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
