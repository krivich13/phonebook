import 'package:phonebook2/provider/auth_api_provider.dart';
import 'package:phonebook2/provider/session_data_provider.dart';

class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthApiProvider();

  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }

  Future<void> login(String login, String password) async {
    final apiKey = await _authApiProvider.login(login, password);
    await _sessionDataProvider.saveApiKey(apiKey);
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  }
}