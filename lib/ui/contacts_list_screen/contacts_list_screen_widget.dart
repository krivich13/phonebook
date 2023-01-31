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
        body: SingleChildScrollView(
            child: Container(
                child: ValueListenableBuilder<List<Contact>>(
                  valueListenable: wm.contactList,
                  builder: (_, data, __) {
                    return buildExpansionPanelList(data);
                  },
                )
            )
        )
    );
  }

  ExpansionPanelList buildExpansionPanelList(List<Contact> data) {
    return ExpansionPanelList.radio(
      children: data.map<ExpansionPanelRadio>((Contact contact) {
        return ExpansionPanelRadio(
            value: contact.id,
            headerBuilder: (_, __) {
              return ListTile(
                title: Text(contact.lastName),
              );
            },
            body: ListTile(
              title: Text(contact.phone),
              subtitle: Text(contact.email),
            )
        );
      }).toList()
    );
  }
}

