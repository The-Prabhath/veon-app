import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String id;
  String name;
  String phoneNumber;
  String street;
  String postalCode;
  String city;
  String state;
  String country;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    this.selectedAddress = false,
  });

  static AddressModel empty() => AddressModel(
        id: '', name: '', phoneNumber: '', street: '',
        postalCode: '', city: '', state: '', country: '',
      );

  /// Full formatted address string
  String get formattedAddress =>
      '$street, $city, $state $postalCode, $country';

  Map<String, dynamic> toJson() => {
        'Name': name,
        'PhoneNumber': phoneNumber,
        'Street': street,
        'PostalCode': postalCode,
        'City': city,
        'State': state,
        'Country': country,
        'SelectedAddress': selectedAddress,
      };

  factory AddressModel.fromMap(Map<String, dynamic> data, String docId) =>
      AddressModel(
        id: docId,
        name: data['Name'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        street: data['Street'] ?? '',
        postalCode: data['PostalCode'] ?? '',
        city: data['City'] ?? '',
        state: data['State'] ?? '',
        country: data['Country'] ?? '',
        selectedAddress: data['SelectedAddress'] ?? false,
      );

  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) =>
      AddressModel.fromMap(doc.data() ?? {}, doc.id);
}
