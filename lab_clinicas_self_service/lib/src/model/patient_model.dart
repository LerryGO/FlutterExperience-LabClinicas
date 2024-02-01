import 'package:json_annotation/json_annotation.dart';

import 'package:lab_clinicas_self_service/src/model/patient_address_model.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final String id;
  final String name;
  final String email;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  final String document;
  final PatientAddressModel address;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;
  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;
  
  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.document,
    required this.address,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
