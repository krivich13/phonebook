import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
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
                  Column(
                    children: _buildPhoneGroup(wm)
                  ),
                ],
              );
            },
          ),
        ));
  }

  List<Widget> _buildPhoneGroup(IContactWidgetModel wm) {
    final List<Widget> column = [
      const Text('Телефоны'),
      ValueListenableBuilder<List<TextEditingController>>(
        valueListenable: wm.phonesCtrlList,
        builder: (_, controllersList, __) {
          return PhonesGroup(readOnly: wm.readOnly.value, controllers: controllersList);
        },
      ),
    ];
    if (!wm.readOnly.value) {
      column.add(TextButton(
      onPressed: () {
        wm.addPhone();
      },
      child: const Text('Добавить')));
    }
    return column;
  }
}

class PhonesGroup extends StatelessWidget {
  final bool readOnly;
  final List<TextEditingController>? controllers;
  const PhonesGroup({Key? key, required this.readOnly, required this.controllers}) : super(key: key);

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
          readOnly: readOnly,
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