import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'auth_screen_wm.dart';

// TODO: cover with documentation
/// Main widget for AuthScreen module
class AuthScreenWidget extends ElementaryWidget<IAuthScreenWidgetModel> {
  const AuthScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultAuthScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAuthScreenWidgetModel wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Авторизация'),
        ),
        body: Column(
          children: [
            const Text('Логин'),
            TextField(
              controller: wm.loginController,
            ),
            const Text('Пароль'),
            TextField(
              controller: wm.passwController,
            ),
            TextButton(onPressed: wm.onClickSignUp, child: const Text('Войти')),
          ],
        )
    );
  }
}
