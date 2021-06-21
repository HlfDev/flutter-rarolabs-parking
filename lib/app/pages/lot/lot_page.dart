import 'package:flutter/material.dart';

import 'package:raro_parking_challenge/app/pages/lot/widgets/card/lot_card_widget.dart';
import 'package:raro_parking_challenge/app/pages/lot/widgets/form/lot_form_widget.dart';
import 'package:raro_parking_challenge/app/pages/lot/widgets/list_view/lot_list_view_widget.dart';

class LotPage extends StatefulWidget {
  @override
  _LotPageState createState() => _LotPageState();
}

class _LotPageState extends State<LotPage> {
  EdgeInsetsGeometry _padding = EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: _padding,
        child: Column(
          children: [
            LotFormWidget(),
            LotCardWidget(),
            Expanded(child: LotListView()),
          ],
        ));
  }
}
