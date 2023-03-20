import 'package:flutter/material.dart';
import '../contact_wm.dart';

class EmailGroup extends StatelessWidget {
  final IContactWidgetModel wm;
  const EmailGroup({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> column = [
      const Text('Электронная почта'),
      ValueListenableBuilder<List<TextEditingController>>(
        valueListenable: wm.emailCtrlList,
        builder: (_, controllersList, __) {
          return EmailList(readOnly: wm.readOnly.value, controllers: controllersList);
        },
      ),
    ];
    if (!wm.readOnly.value) {
      column.add(TextButton(
      onPressed: () {
        wm.addEmail();
      },
      child: const Text('Добавить')));
    }
    return Column(
      children: column,
    );
  }
}

class EmailList extends StatelessWidget {
  final bool readOnly;
  final List<TextEditingController>? controllers;
  const EmailList({Key? key, required this.readOnly, required this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: controllers!.map<ListTile>((TextEditingController phoneCtrl) {
      return ListTile(
        title: TextField(
          controller: phoneCtrl,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Email"),
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