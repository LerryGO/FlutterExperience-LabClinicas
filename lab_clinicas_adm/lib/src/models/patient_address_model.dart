import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  @JsonKey(name: 'cep', defaultValue: '')
  String cep;
  @JsonKey(name: 'street_address')
  String streetAddress;
  String number;
  @JsonKey(name: 'address_complement')
  String addressComplement;
  String state;
  String city;
  String district;

  PatientAddressModel({
    required this.cep,
    required this.streetAddress,
    required this.number,
    required this.addressComplement,
    required this.state,
    required this.city,
    required this.district,
  });

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);
}
