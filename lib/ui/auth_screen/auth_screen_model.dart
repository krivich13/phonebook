import 'package:elementary/elementary.dart';
import 'package:phonebook2/service/auth_service.dart';

// TODO: cover with documentation
/// Default Elementary model for AuthScreen module
class AuthScreenModel extends ElementaryModel {
  final _authService = AuthService();

  AuthService get authService => _authService;

  AuthScreenModel();
}
