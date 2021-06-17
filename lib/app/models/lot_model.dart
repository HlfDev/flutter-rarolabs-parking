import 'dart:convert';

class LotModel {

  static String _id = 'id';
  static String _lotCode = 'lotCode';
  static String _emptySpace = 'emptySpace';


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
      _id: id,
      _lotCode: lotCode,
      _emptySpace: emptySpace,
    };
  }

  factory LotModel.fromMap(Map<String, dynamic> map) {
    return LotModel(
      id: map[_id],
      lotCode: map[_lotCode],
      emptySpace: map[_emptySpace],
    );
  }

  String toJson() => json.encode(toMap());

  factory LotModel.fromJson(String source) =>
      LotModel.fromMap(json.decode(source));
}
