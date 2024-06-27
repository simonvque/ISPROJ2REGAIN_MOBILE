import 'dart:typed_data';

class User {
  int? id;
  int? role;
  String? firstName;
  String? lastName;
  String username;
  String contactNumber;
  String password;
  String? email;
  int? address;
  String accountStatus;
  int? penaltyPoints;
  double? commissionBalance;
  Uint8List? pict;

  User(
      {this.id,
      this.role,
      this.firstName,
      this.lastName,
      required this.username,
      required this.contactNumber,
      required this.password,
      this.email,
      this.address,
      this.accountStatus = "Active",
      this.penaltyPoints});
}
