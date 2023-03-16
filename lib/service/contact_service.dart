import 'dart:convert';

import 'package:phonebook2/entity/contact.dart';
import 'package:phonebook2/provider/contact_api_provider.dart';
import 'package:http/http.dart' as http;

import '../provider/session_data_provider.dart';

class ContactService {
  final _sessionDataProvider = SessionDataProvider();
  final _contactApiProvider = ContactApiProvider();

  Future<List<Contact>> getContactList() async {
    final apiKey = _sessionDataProvider.apiKey();
    // apikey нужно передать в http запросе. пока просто имитируем успешный JSON ответ от сервера

    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/contacts/list'));
    if (response.statusCode == 200) {
      List<dynamic> contactJsonList = jsonDecode(response.body);
      List<Contact> contactList = contactJsonList.map((contactJson) => Contact.fromJson(contactJson)).toList();
      return contactList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<int> createContact(Contact contact) async {
    String json = jsonEncode(contact);
    
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/contacts/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json
    );

    if (response.statusCode == 201) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to create contact.');
    }
  }

  // TODO переписать метод обновления контакта
  Future<int> updateContact(int id, Contact contact) async {
    String json = jsonEncode(contact);
    
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8080/contacts/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json
    );

    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to update contact.');
    }
  }
}