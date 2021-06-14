import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/shared/models/parking_model.dart';
import 'package:raro_parking_challenge/app/shared/provider/parking_provider.dart';

class ParkingFormPage extends StatefulWidget {
  @override
  _ParkingFormPageState createState() => _ParkingFormPageState();
}

class _ParkingFormPageState extends State<ParkingFormPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  void _loadFormData(ParkingModel parkingModel) {
    _formData['id'] = parkingModel.id;
    _formData['parkingName'] = parkingModel.parkingName;
    _formData['valuePerHourSmallVeicles'] =
        parkingModel.valuePerHourSmallVeicles;
    _formData['valuePerHourMediumVeicles'] =
        parkingModel.valuePerHourMediumVeicles;
    _formData['valuePerHourBigVeicles'] = parkingModel.valuePerHourBigVeicles;
    _formData['parkingLots'] = parkingModel.parkingLots;
  }

  @override
  Widget build(BuildContext context) {
    final Object? parkingModel = ModalRoute.of(context)!.settings.arguments;

    _loadFormData(parkingModel as ParkingModel);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _formData['id'].isEmpty
            ? Text('Cadastro de Estacionamento')
            : Text('Editar Estacionamento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['parkingName'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o nome do Estacionamento';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['parkingName'] = value ?? '',
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  maxLength: 80,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.create),
                    labelText: 'Nome do Estacionamento',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: _formData['valuePerHourSmallVeicles'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o valor por Horas de Veículos Pequenos';
                    }
                    return null;
                  },
                  onSaved: (value) =>
                      _formData['valuePerHourSmallVeicles'] = value ?? '',
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.two_wheeler),
                    labelText: 'Valor/Hora Veiculos Pequenos',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: _formData['valuePerHourMediumVeicles'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o valor por Horas de Veículos Médios';
                    }
                    return null;
                  },
                  onSaved: (value) =>
                      _formData['valuePerHourMediumVeicles'] = (value) ?? '',
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.directions_car),
                    labelText: 'Valor/Hora Veiculos Médios',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: _formData['valuePerHourBigVeicles'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o valor por Horas de Veículos Grandes';
                    }
                    return null;
                  },
                  onSaved: (value) =>
                      _formData['valuePerHourBigVeicles'] = value ?? '',
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.local_shipping),
                    labelText: 'Valor/Hora Veiculos Grandes',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: _formData['parkingLots'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha a quantidade de vagas';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['parkingLots'] = value ?? '1',
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.local_parking),
                    labelText: 'Quantidade de Vagas',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        Provider.of<ParkingProvider>(context, listen: false)
                            .put(
                          ParkingModel(
                            id: _formData['id'] ?? '',
                            parkingName: _formData['parkingName'],
                            valuePerHourSmallVeicles:
                                _formData['valuePerHourSmallVeicles'],
                            valuePerHourMediumVeicles:
                                _formData['valuePerHourMediumVeicles'],
                            valuePerHourBigVeicles:
                                _formData['valuePerHourBigVeicles'],
                            parkingLots: _formData['parkingLots'],
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                        textStyle: TextStyle(fontSize: 24)),
                    child: _formData['id'].isEmpty
                        ? Text(
                            'Cadastrar',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
