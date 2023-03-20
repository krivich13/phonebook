import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/ui/contact_screen/widgets/email_group.dart';
import 'package:phonebook2/ui/contact_screen/widgets/phones_group.dart';
import 'package:phonebook2/ui/contact_screen/widgets/socnet_gruop.dart';
import 'contact_wm.dart';

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
          actions: [
            ValueListenableBuilder<bool>(
            valueListenable: wm.readOnly,
            builder: (_, readOnly, ___) {
              return readOnly ? EditButton(wm: wm) : SaveButton(wm: wm);
            }
            )
          ],
        ),
        body: SingleChildScrollView(
          child: ValueListenableBuilder<bool>(
            valueListenable: wm.readOnly,
            builder: (_, readOnly, ___) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.lastNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Фамилия'),
                    ),
                    readOnly: readOnly,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.firstNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Имя'),
                    ),
                    readOnly: readOnly,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.secondNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Отчество'),
                    ),
                    readOnly: readOnly,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wm.nickNameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Псевдоним'),
                    ),
                    readOnly: readOnly,
                  ),
                  const SizedBox(height: 20),
                  PhonesGroup(wm: wm),
                  EmailGroup(wm: wm),
                  SocNetGroup(wm: wm)
                ],
              );
            },
          ),
        ));
  }
}

class EditButton extends StatelessWidget {
  final IContactWidgetModel wm;
  const EditButton({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: () {wm.changeMode();}, 
              child: const Icon(Icons.edit));
  }
}

class SaveButton extends StatelessWidget {
  final IContactWidgetModel wm;
  const SaveButton({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: () {wm.saveContact();}, 
              child: const Icon(Icons.save));
  }
}