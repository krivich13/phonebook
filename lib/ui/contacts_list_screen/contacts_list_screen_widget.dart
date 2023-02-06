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
                    return buildExpansionPanelList(wm, data);
                  },
                )
            )
        )
    );
  }

  ExpansionPanelList buildExpansionPanelList(IContactsListScreenWidgetModel wm, List<Contact> data) {
    return ExpansionPanelList.radio(
      children: data.map<ExpansionPanelRadio>((Contact contact) {
        var index = data.indexOf(contact);
        return ExpansionPanelRadio(
            value: index,
            headerBuilder: (_, __) {
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${contact.lastName} ${contact.firstName} ${contact.secondName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      contact.phones[0],
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(contact.email)
                  ],
                ),
                onLongPress: () => wm.openContact(index),
              );
            },
            body: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Дополнительные телефоны:'),
                    //OtherPhones(contact.otherPhones)
                  ],
              ),
              subtitle: const Text('Комментарии:'),
            ),
            canTapOnHeader: true
        );
      }).toList()
    );
  }
}

class OtherPhones extends StatelessWidget {
  final List<String> phones;
  const OtherPhones({
    Key? key,
    required this.phones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: phones.map<Text>((String phone) {
        return Text(phone);
      }).toList(),
    );
  }
}

