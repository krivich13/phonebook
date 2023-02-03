import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/app_model.dart';
import 'package:phonebook2/main.dart';
import 'package:phonebook2/service/contact_service.dart';
import 'package:phonebook2/ui/contact_screen/contact_widget.dart';
import '../../entity/contact.dart';
import '../../service/navigation_helper.dart';
import 'contacts_list_screen_model.dart';
import 'contacts_list_screen_widget.dart';

abstract class IContactsListScreenWidgetModel extends IWidgetModel {
  ValueListenable<List<Contact>> get contactList;

  void openContact(int index);
}

ContactsListScreenWidgetModel defaultContactsListScreenWidgetModelFactory(
    BuildContext context) {
  return ContactsListScreenWidgetModel(
      ContactsListScreenModel(ContactService(), getIt<AppModel>()),
    NavigationHelper()
  );
}

// TODO: cover with documentation
/// Default widget model for ContactsListScreenWidget
class ContactsListScreenWidgetModel
    extends WidgetModel<ContactsListScreenWidget, ContactsListScreenModel>
    implements IContactsListScreenWidgetModel {
  final NavigationHelper _navigator;

  ContactsListScreenWidgetModel(ContactsListScreenModel model, this._navigator) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getContactList();
  }

  @override
  ValueListenable<List<Contact>> get contactList => model.contactList;

  @override
  void openContact(int index) {
    model.openContact(index);
    _navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const ContactWidget(),
      ),
    );
  }
}
