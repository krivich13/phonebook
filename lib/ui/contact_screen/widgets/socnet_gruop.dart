import 'package:flutter/material.dart';
import '../contact_wm.dart';

class SocNetGroup extends StatelessWidget {
  final IContactWidgetModel wm;
  const SocNetGroup({Key? key, required this.wm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> column = [
      const Text('Социальные сети'),
      ValueListenableBuilder<List<TextEditingController>>(
        valueListenable: wm.socNetCtrlList,
        builder: (_, controllersList, __) {
          return SocNetList(
              readOnly: wm.readOnly.value, controllers: controllersList);
        },
      ),
    ];
    if (!wm.readOnly.value) {
      column.add(TextButton(
          onPressed: () {
            wm.addSocNet();
          },
          child: const Text('Добавить')));
    }
    return Column(
      children: column,
    );
  }
}

class SocNetList extends StatelessWidget {
  final bool readOnly;
  final List<TextEditingController>? controllers;
  const SocNetList(
      {Key? key, required this.readOnly, required this.controllers})
      : super(key: key);

  static const List<String> socTypeList = <String>[
    'Telegram',
    'Vk',
    'Facebook',
    'Youtube',
    'Rutube',
    'etc'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children:
            controllers!.map<ListTile>((TextEditingController socNetCtrl) {
              return ListTile(
                title: Row(children: [
                  DropdownButton<String>(
                    value: socTypeList.first,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                    },
                    items: socTypeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Expanded(
                      child: TextField(
                        controller: socNetCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Соц сеть"),
                        ),
                        readOnly: readOnly,
                      )
                  )
                ]),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [const PopupMenuItem(child: Text('Сделать основным'))];
                  },
                ),
              );
    }).toList());
  }
}
