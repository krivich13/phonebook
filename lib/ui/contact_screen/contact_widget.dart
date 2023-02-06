import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:phonebook2/entity/contact.dart';
import 'contact_wm.dart';

// TODO: cover with documentation
/// Main widget for Contact module
class ContactWidget extends ElementaryWidget<IContactWidgetModel> {
  const ContactWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultContactWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IContactWidgetModel wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Контакт'),
        ),
        body: SingleChildScrollView(
          child: ValueListenableBuilder<Contact>(
            valueListenable: wm.contact,
            builder: (_, contact, ___) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(contact.lastName),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(contact.firstName),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(contact.secondName),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(contact.nickName ?? ''),
                    ),
                  ),
                  SizedBox(height: 20),
                  PhonesGroup(
                    phones: contact.phones,
                  ),
                ],
              );
            },
          ),
        ));
  }
}

class PhonesGroup extends StatelessWidget {
  final List<String> phones;

  const PhonesGroup({
    Key? key,
    required this.phones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Телефоны'),
      Column(
        children: phones.map<ListTile>((String phone) {
          return ListTile(
            title: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(phone),
              ),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [const PopupMenuItem(child: Text('Сделать основным'))];
              },
            ),
          );
        }).toList(),
      ),
      TextButton(onPressed: () {}, child: const Text('Добавить'))
    ]);
  }
}
