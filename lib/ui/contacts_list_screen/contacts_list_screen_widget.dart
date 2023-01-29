import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import '../../entity/contact.dart';
import 'contacts_list_screen_wm.dart';

// TODO: cover with documentation
/// Main widget for ContactsListScreen module
class ContactsListScreenWidget
    extends ElementaryWidget<IContactsListScreenWidgetModel> {
  const ContactsListScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultContactsListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IContactsListScreenWidgetModel wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список контактов'),
        ),
        body: ValueListenableBuilder<List<Contact>>(
          valueListenable: wm.contactList,
          builder: (_, data, __) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final contact in data)
                    ContactSmallWidget(contact: contact)
                ],
              ),
            );
          },
        ));
  }
}

class ContactSmallWidget extends StatelessWidget {
  final Contact contact;

  const ContactSmallWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = contact.firstName + ' ' + contact.lastName;
    return ListTile(
      title: Text(title),
      subtitle: Text(contact.phone),
    );
  }
}
