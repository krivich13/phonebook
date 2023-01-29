abstract class AuthApiProviderError {}

class AuthApiProviderIncorrectLoginDataError {}

class AuthApiProvider {
  Future<String> login(String login, String password) async {
    final isSuccess = login == 'admin' && password == 'admin';
    if (isSuccess) {
      return 'efewgtyh5y4y3ygrhyw';
    } else {
      throw AuthApiProviderIncorrectLoginDataError();
    }
  }
}