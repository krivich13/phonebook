import 'package:elementary/elementary.dart';
import 'package:phonebook2/entity/contact.dart';
import 'package:flutter/foundation.dart';
import '../../app_model.dart';
import '../../service/contact_service.dart';

// TODO: cover with documentation
/// Default Elementary model for ContactsListScreen module
class ContactsListScreenModel extends ElementaryModel {
  final ValueNotifier<List<Contact>> contactList = ValueNotifier([]);
  final ContactService _contactService;
  final AppModel _appModel;

  ContactsListScreenModel(this._contactService, this._appModel);

  Future<void> getContactList() async {
    final value = await _contactService.getContactList();
    _appModel.contactList = value;
    contactList.value = value;
  }

  void openContact(int index) {
    _appModel.openedContact = index;
  }

  void closeContact() {
    _appModel.openedContact = null;
  }
}
