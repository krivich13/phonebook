import 'package:flutter/foundation.dart';

import 'entity/contact.dart';

class AppModel extends ChangeNotifier {
  ValueNotifier<List<Contact>> contactList = ValueNotifier([]);
  int? openedContact;
}
