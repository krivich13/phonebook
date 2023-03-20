import 'package:flutter/material.dart';
import '../contact_wm.dart';

class PhonesGroup extends StatelessWidget {
  final IContactWidgetModel wm;
  const PhonesGroup({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> column = [
      const Text('Телефоны'),
      ValueListenableBuilder<List<TextEditingController>>(
        valueListenable: wm.phonesCtrlList,
        builder: (_, controllersList, __) {
          return PhonesList(readOnly: wm.readOnly.value, controllers: controllersList);
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
    return Column(
      children: column,
    );
  }
}

class PhonesList extends StatelessWidget {
  final bool readOnly;
  final List<TextEditingController>? controllers;
  const PhonesList({Key? key, required this.readOnly, required this.controllers}) : super(key: key);

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