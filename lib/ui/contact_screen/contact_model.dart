import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:phonebook2/service/contact_service.dart';
import '../../app_model.dart';
import '../../entity/contact.dart';

class ContactModel extends ElementaryModel {
  Contact contact = Contact(
    id: 0,
    lastName: '',
    firstName: '',
    secondName: '',
    nickName: '',
    phones: [],
    email: [],
    socNet: [],
    importantDate: [],
    comment: '',

  );

  final ContactService _contactService;

  final ValueNotifier<List<String>> phones = ValueNotifier([]);

  final AppModel _appModel;

  final ValueNotifier<bool> readOnly = ValueNotifier(true);

  ContactModel(this._appModel, this._contactService);

  getContact() {
    if (_appModel.openedContact != null) {
      contact = _appModel.contactList.value[_appModel.openedContact!];
      readOnly.value = true;
    } else {
      readOnly.value = false;
    }
  }

  changeMode() {
    readOnly.value = !readOnly.value;
  }

  saveContact() async {
    _contactService.createContact(contact);
    final value = await _contactService.getContactList();
    _appModel.contactList.value = value;
  }
}
