import 'package:elementary/elementary.dart';

import '../../app_model.dart';
import '../../entity/contact.dart';

// TODO: cover with documentation
/// Default Elementary model for Contact module
class ContactModel extends ElementaryModel {
  late Contact contact;
  final AppModel _appModel;

  ContactModel(this._appModel);

  getContact() {
    if (_appModel.openedContact != null) {
      final value = _appModel.contactList![_appModel.openedContact!];
      contact = value;
    }
  }
}
