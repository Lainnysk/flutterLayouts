class AdmissionEntity {
  int? id;
  late String dateOfAdmission;
  late int quantity;
  late int id_provider;
  late int id_product;

  AdmissionEntity({required this.dateOfAdmission, 
  required this.quantity,
  required this.id_provider, 
  required this.id_product});
}