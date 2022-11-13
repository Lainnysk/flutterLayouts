import 'package:pr2/domain/entity/admission_entity.dart';

class Admission extends AdmissionEntity {
  int? id;
  late String dateOfAdmission;
  late int quantity;
  late int id_provider;
  late int id_product;

  Admission({required this.dateOfAdmission, required this.quantity, required this.id_provider, required this.id_product}) : super(dateOfAdmission: dateOfAdmission, quantity: quantity, id_provider: id_provider, id_product: id_product);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateOfAdmission': dateOfAdmission,
      'quantity': quantity,
      'id_provider': id_provider,
      'id_product': id_product,
    };    
  }

  factory Admission.toFromMap(Map<String, dynamic> json) {
    return Admission(dateOfAdmission: json['dateOfAdmission'], 
        quantity: json['quantity'],
        id_provider: json['id_provider'],
        id_product: json['id_product']);
  }
}