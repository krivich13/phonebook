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
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.lastNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Фамилия'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.firstNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Имя'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.secondNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Отчество'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.nickNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Псевдоним'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text('Телефоны'),
                      StateNotifierBuilder<List<TextEditingController>>(
                        listenableState: wm.phonesCtrlList,
                        builder: (_, controllersList) {
                          return PhonesGroup(controllers: controllersList);
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            wm.addPhone();
                          },
                          child: const Text('Добавить'))
                    ],
                  ),
                ],
              );
            },
          ),
        ));
  }
}

class PhonesGroup extends StatelessWidget {
  final List<TextEditingController>? controllers;
  const PhonesGroup({Key? key, required this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: controllers!.map<ListTile>((TextEditingController phoneCtrl) {
      return ListTile(
        title: TextField(
          controller: phoneCtrl,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Телефон"),
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [const PopupMenuItem(child: Text('Сделать основным'))];
          },
        ),
      );
    }).toList());
  }
}