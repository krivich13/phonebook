import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Contact {
  final int id;
  final String lastName;
  final String firstName;
  final String secondName;
  final String nickName;
  final List<String> phones;
  final List<String> email;
  final List<String> socNet;
  final List<String> importantDate;
  final String comment;

  Contact({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.secondName,
    required this.nickName,
    required this.phones,
    required this.email,
    required this.socNet,
    required this.importantDate,
    required this.comment
  });

  Contact.undefined(): this(
    id: 0,
    lastName: "",
    firstName: "",
    secondName: "",
    nickName: "",
    phones: [],
    email: [],
    socNet: [],
    importantDate: [],
    comment: ""
  );

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}