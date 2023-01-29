// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as int,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      secondName: json['second_name'] as String,
      nickName: json['nick_name'] as String?,
      phone: json['phone'] as String,
      email: json['email'] as String,
      socNet: json['soc_net'] as String?,
      importantDate: json['important_date'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'nick_name': instance.nickName,
      'phone': instance.phone,
      'email': instance.email,
      'soc_net': instance.socNet,
      'important_date': instance.importantDate,
      'comment': instance.comment,
    };
