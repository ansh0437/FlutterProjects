import 'dart:convert';

class CountryCodeDTO {
  String countryName;
  String countryCode;
  String dialCode;

  CountryCodeDTO({
    this.countryName,
    this.countryCode,
    this.dialCode,
  });

  String get displayCode => "$countryCode ($dialCode)";

  factory CountryCodeDTO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CountryCodeDTO(
      countryName: map['name'],
      countryCode: map['code'],
      dialCode: map['dial_code'],
    );
  }

  factory CountryCodeDTO.fromJson(String source) =>
      CountryCodeDTO.fromMap(json.decode(source));

  @override
  String toString() =>
      'CountryCodeDTO(countryName: $countryName, countryCode: $countryCode, dialCode: $dialCode)';
}
