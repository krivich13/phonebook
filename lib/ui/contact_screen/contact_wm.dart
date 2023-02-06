import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/app_model.dart';
import 'package:phonebook2/entity/contact.dart';
import 'package:phonebook2/main.dart';
import 'contact_model.dart';
import 'contact_widget.dart';

abstract class IContactWidgetModel extends IWidgetModel {
  ValueListenable<Contact> get contact;
}

ContactWidgetModel defaultContactWidgetModelFactory(BuildContext context) {
  return ContactWidgetModel(
      ContactModel(getIt<AppModel>()),
  );
}

// TODO: cover with documentation
/// Default widget model for ContactWidget
class ContactWidgetModel extends WidgetModel<ContactWidget, ContactModel>
    implements IContactWidgetModel {

  ContactWidgetModel(ContactModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getContact();
  }

  @override
  ValueListenable<Contact> get contact => model.contact;
}
