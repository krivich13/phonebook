import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:phonebook2/provider/auth_api_provider.dart';
import 'package:phonebook2/ui/contacts_list_screen/contacts_list_screen_widget.dart';
import '../../service/navigation_helper.dart';
import 'auth_screen_model.dart';
import 'auth_screen_widget.dart';

abstract class IAuthScreenWidgetModel extends IWidgetModel {
  TextEditingController get loginController;

  TextEditingController get passwController;

  Future<void> onClickSignUp();
}

AuthScreenWidgetModel defaultAuthScreenWidgetModelFactory(BuildContext context) {
  return AuthScreenWidgetModel(AuthScreenModel(), NavigationHelper());
}

// TODO: cover with documentation
/// Default widget model for AuthScreenWidget
class AuthScreenWidgetModel extends WidgetModel<AuthScreenWidget, AuthScreenModel>
    implements IAuthScreenWidgetModel {

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwController = TextEditingController();
  final NavigationHelper _navigator;

  AuthScreenWidgetModel(AuthScreenModel model, this._navigator) : super(model);

  @override
  TextEditingController get loginController => _loginController;

  @override
  TextEditingController get passwController => _passwController;

  @override
  Future<void> onClickSignUp() async {
    final login = _loginController.text;
    final password = _passwController.text;

    if (login.isEmpty || password.isEmpty) return;

    try {
      await model.authService.login(login, password);
      _navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ContactsListScreenWidget())
      );
    } on AuthApiProviderIncorrectLoginDataError {

    } catch (exeption) {

    }

  }
}
