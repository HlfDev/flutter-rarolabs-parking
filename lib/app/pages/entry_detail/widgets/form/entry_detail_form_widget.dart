import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';
import 'package:raro_parking_challenge/app/provider/parking_provider.dart';

class EntryDetailFormWidget extends StatefulWidget {
  const EntryDetailFormWidget({Key? key}) : super(key: key);

  @override
  _EntryDetailFormWidgetState createState() => _EntryDetailFormWidgetState();
}

class _EntryDetailFormWidgetState extends State<EntryDetailFormWidget> {
  final _formKey = GlobalKey<FormState>();

  static String _id = 'id';
  static String _model = 'model';
  static String _plate = 'plate';
  static String _lotCode = 'lotCode';
  static String _entryDate = 'entryDate';
  static String _departureDate = 'departureDate';

  final Map<String, dynamic> _formData = {};

  void _loadFormData(ParkingLotModel parkingModel) {
    _formData[_id] = parkingModel.id;
    _formData[_model] = parkingModel.model;
    _formData[_plate] = parkingModel.plate;
    _formData[_lotCode] = parkingModel.lotCode;
    _formData[_entryDate] = parkingModel.entryDate;
    _formData[_departureDate] = parkingModel.departureDate;
  }

  @override
  Widget build(BuildContext context) {
    final parkingModel =
        ModalRoute.of(context)!.settings.arguments as ParkingLotModel;

    _loadFormData(parkingModel);

    return Form(
      key: _formKey,
      child: Card(
        color: Colors.grey[300],
        shadowColor: Colors.grey,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData[_model],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o nome do Estacionamento';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData[_model] = value ?? '',
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.local_shipping),
                        labelText: 'Modelo/Descrição',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      initialValue: _formData[_lotCode],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o nome do Estacionamento';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData[_lotCode] = value ?? '',
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.tag),
                        labelText: 'Código da Vaga',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData[_plate],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o nome do Estacionamento';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData[_plate] = value ?? '',
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.subtitles),
                        labelText: 'Placa',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        Provider.of<ParkingProvider>(context, listen: false)
                            .put(
                          ParkingLotModel(
                            id: _formData[_id] ?? '',
                            departureDate: _formData[_departureDate] ?? '',
                            entryDate: _formData[_entryDate] ?? '',
                            lotCode: _formData[_lotCode] ?? '',
                            model: _formData[_model] ?? '',
                            plate: _formData[_plate] ?? '',
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    label: Text(
                      'Alterar Campos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
