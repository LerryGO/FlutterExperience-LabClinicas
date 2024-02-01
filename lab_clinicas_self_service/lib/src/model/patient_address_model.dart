import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  final String cep;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  final String state;
  final String city;
  final String district;

  PatientAddressModel({
    required this.cep,
    required this.streetAddress,
    required this.state,
    required this.city,
    required this.district,
  });

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);
}
