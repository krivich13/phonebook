import 'package:elementary/elementary.dart';
import 'package:phonebook2/entity/contact.dart';
import 'package:flutter/foundation.dart';
import '../../app_model.dart';
import '../../service/contact_service.dart';

class ContactsListScreenModel extends ElementaryModel {
  final ContactService _contactService;
  final AppModel _appModel;

  ValueNotifier<List<Contact>> get contactList => _appModel.contactList;

  ContactsListScreenModel(this._contactService, this._appModel);

  Future<void> getContactList() async {
    final value = await _contactService.getContactList();
    _appModel.contactList.value = value;
  }

  void openContact(int index) {
    _appModel.openedContact = index;
  }

  void closeContact() {
    _appModel.openedContact = null;
  }
}
