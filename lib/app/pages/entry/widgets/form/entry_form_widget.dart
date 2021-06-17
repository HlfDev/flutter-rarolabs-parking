import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raro_parking_challenge/app/models/parking_model.dart';
import 'package:raro_parking_challenge/app/provider/parking_provider.dart';

class EntryFormWidget extends StatefulWidget {
  const EntryFormWidget({Key? key}) : super(key: key);

  @override
  _EntryFormWidgetState createState() => _EntryFormWidgetState();
}

class _EntryFormWidgetState extends State<EntryFormWidget> {
  final Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();

  final _controllerModel = TextEditingController();
  final _controllerPlate = TextEditingController();
  final _controllerLotCode = TextEditingController();
  final _controllerValuePerHour = TextEditingController();

  void _loadFormData(ParkingLotModel parkingModel) {
    _formData['id'] = parkingModel.id;
    _formData['model'] = parkingModel.model;
    _formData['plate'] = parkingModel.plate;
    _formData['lotCode'] = parkingModel.lotCode;
    _formData['entryDate'] = parkingModel.entryDate;
    _formData['departureDate'] = parkingModel.departureDate;
  }

  @override
  Widget build(BuildContext context) {
    final ParkingLotModel parkingModel = ParkingLotModel(
      departureDate: '',
      entryDate: '',
      id: '',
      lotCode: '',
      model: '',
      plate: '',
    );

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
                      controller: _controllerModel,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o Modelo';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['model'] = value ?? '',
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
                      controller: _controllerLotCode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha a Vaga';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['lotCode'] = value ?? '',
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
                      controller: _controllerPlate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha a placa';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['plate'] = value ?? '',
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
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          Provider.of<ParkingProvider>(context, listen: false)
                              .put(
                            ParkingLotModel(
                              id: _formData['id'] ?? '',
                              departureDate: '',
                              entryDate: '${DateTime.now()}',
                              lotCode: _formData['lotCode'] ?? '',
                              model: _formData['model'] ?? '',
                              plate: _formData['plate'] ?? '',
                            ),
                          );

                          _controllerModel.text = '';
                          _controllerPlate.text = '';
                          _controllerLotCode.text = '';
                          _controllerValuePerHour.text = '';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      label: Text(
                        'Realizar Entrada',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.garage,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
