import 'package:phonebook2/ui/auth_screen/auth_screen_widget.dart';
import 'package:flutter/material.dart';

class PhonebookApp extends StatelessWidget {
  const PhonebookApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Телефонная книга',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreenWidget(),
    );
  }
}
