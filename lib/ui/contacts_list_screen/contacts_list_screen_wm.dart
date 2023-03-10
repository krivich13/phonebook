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

  void openContactScreen([int? index]);
}

ContactsListScreenWidgetModel defaultContactsListScreenWidgetModelFactory(
    BuildContext context) {
  return ContactsListScreenWidgetModel(
      ContactsListScreenModel(ContactService(), getIt<AppModel>()),
    NavigationHelper()
  );
}

class ContactsListScreenWidgetModel
    extends WidgetModel<ContactsListScreenWidget, ContactsListScreenModel>
    implements IContactsListScreenWidgetModel {
  final NavigationHelper _navigator;

  @override
  ValueListenable<List<Contact>> get contactList => model.contactList;

  ContactsListScreenWidgetModel(ContactsListScreenModel model, this._navigator) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getContactList();
  }

  @override
  void openContactScreen([int? index]) {
    if (index != null) {
      model.openContact(index);
    } else {
      model.closeContact();
    }
    _navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const ContactWidget(),
      ),
    );
  }
}
