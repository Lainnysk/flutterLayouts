import 'package:pr2/domain/entity/characteristic_entity.dart';

class Characteristic extends CharacteristicEntity {
  int? id;
  late String color;
  late double height;
  late double width;
  late int fragile;

  Characteristic({required this.color, required this.height, required this.width,  required this.fragile}) : super(color: color, height: height, width: width, fragile: fragile);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'height': height,
      'width': width,
      'fragile': fragile
    };
  }

  factory Characteristic.toFromMap(Map<String, dynamic> json) {
    return Characteristic(color: json['color'], height: json['height'], width: json['width'], fragile: json['fragile']);
  }
}