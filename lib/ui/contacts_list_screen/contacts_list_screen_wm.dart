import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/service/contact_service.dart';
import '../../entity/contact.dart';
import 'contacts_list_screen_model.dart';
import 'contacts_list_screen_widget.dart';

abstract class IContactsListScreenWidgetModel extends IWidgetModel {
  ValueListenable<List<Contact>> get contactList;
}

ContactsListScreenWidgetModel defaultContactsListScreenWidgetModelFactory(
    BuildContext context) {
  return ContactsListScreenWidgetModel(
      ContactsListScreenModel(ContactService())
  );
}

// TODO: cover with documentation
/// Default widget model for ContactsListScreenWidget
class ContactsListScreenWidgetModel
    extends WidgetModel<ContactsListScreenWidget, ContactsListScreenModel>
    implements IContactsListScreenWidgetModel {
  ContactsListScreenWidgetModel(ContactsListScreenModel model) : super(model);


  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getContactList();
  }

  @override
  ValueListenable<List<Contact>> get contactList => model.contactList;
}
