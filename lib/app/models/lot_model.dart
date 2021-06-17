import 'dart:convert';

class LotModel {
  final String id;
  final String lotCode;
  final bool emptySpace;

  const LotModel({
    required this.id,
    required this.lotCode,
    required this.emptySpace,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lotCode': lotCode,
      'emptySpace': emptySpace,
    };
  }

  factory LotModel.fromMap(Map<String, dynamic> map) {
    return LotModel(
      id: map['id'],
      lotCode: map['lotCode'],
      emptySpace: map['lotCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LotModel.fromJson(String source) =>
      LotModel.fromMap(json.decode(source));
}
