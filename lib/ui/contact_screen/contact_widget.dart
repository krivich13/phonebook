import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(wm.contact.lastName),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(wm.contact.firstName),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(wm.contact.secondName),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(wm.contact.nickName ?? ''),
                ),
              ),
              SizedBox(height: 20),
              //PhonesGroup(),

            ],
          ),
        ));
  }
}

class PhonesGroup extends StatelessWidget {
  final ValueListenable<List<String>> phones;
  const PhonesGroup({
    Key? key, required this.phones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Телефоны'),
        ValueListenableBuilder<List<String>>(
            valueListenable: phones,
            builder: (_, __, ___) {return const Text('');},
        ),
        Column(
          children: [
            ListTile(
              title: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                        child: Text('Сделать основным'))
                  ];
                },
              ),
            ),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: const Text('Добавить'))
      ],
    );
  }
}