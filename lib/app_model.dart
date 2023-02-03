import 'package:flutter/foundation.dart';

import 'entity/contact.dart';

class AppModel extends ChangeNotifier {
  List<Contact>? contactList;
  int? openedContact;
}
