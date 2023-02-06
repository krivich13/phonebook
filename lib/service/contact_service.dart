import 'dart:convert';

import 'package:phonebook2/entity/contact.dart';
import 'package:phonebook2/provider/contact_api_provider.dart';

import '../provider/session_data_provider.dart';

class ContactService {
  final _sessionDataProvider = SessionDataProvider();
  final _contactApiProvider = ContactApiProvider();

  Future<List<Contact>> getContactList() async {
    final apiKey = _sessionDataProvider.apiKey();
    // apikey нужно передать в http запросе. пока просто имитируем успешный JSON ответ от сервера
    const contactListResponse = '[{"id":1,"last_name":"Кривошеин","first_name":"Олег","second_name":"Владимирович","nick_name":"krivich","phones":["+79999999999","+78888888888"],"email":"krivich@krivich.ru","soc_net":"tg","important_date":"","comment":""},{"id":2,"last_name":"Петров","first_name":"Пётр","second_name":"Петрович","nick_name":"petya","phones":["+77777777777"],"email":"petya@petya.com","soc_net":"vk","important_date":"","comment":""}]';

    final contactListJson = jsonDecode(contactListResponse ?? '') as List;

    final result = <Contact>[];
    for (final contact in contactListJson) {
      result.add(Contact.fromJson(contact as Map<String, dynamic>));
    }

    return result;
  }
}