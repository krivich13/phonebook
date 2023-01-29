import 'package:elementary/elementary.dart';
import 'package:phonebook2/entity/contact.dart';
import 'package:flutter/foundation.dart';
import '../../service/contact_service.dart';

// TODO: cover with documentation
/// Default Elementary model for ContactsListScreen module
class ContactsListScreenModel extends ElementaryModel {
  final ValueNotifier<List<Contact>> contactList = ValueNotifier([]);
  final ContactService _contactService;

  ContactsListScreenModel(this._contactService);

  Future<void> getContactList() async {
    final value = await _contactService.getContactList();
    contactList.value = value;
  }
}
