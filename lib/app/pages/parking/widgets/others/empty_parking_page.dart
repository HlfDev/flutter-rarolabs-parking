import 'dart:ui';

import 'package:flutter/material.dart';

class EmptyParking extends StatelessWidget {
  const EmptyParking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/empty_parking.png')),
          Expanded(
            flex: 2,
            child: Text(
              'Clique no botão "Novo Estacionamento" para Cadastrar seus Estacionamentos.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: (20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
