import 'package:pr2/domain/entity/provider_entity.dart';

class Provider extends ProviderEntity {
  int? id;
  late String orgName;
  late String telNum;
  late String email;

  Provider({required this.orgName, required this.telNum, required this.email}) : super(orgName: orgName, telNum: telNum, email: email);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orgName': orgName,
      'telNum': telNum,
      'email': email
    };
  }

  factory Provider.toFromMap(Map<String, dynamic> json) {
    return Provider(orgName: json['orgName'], telNum: json['telNum'], email: json['email']);
  }
}