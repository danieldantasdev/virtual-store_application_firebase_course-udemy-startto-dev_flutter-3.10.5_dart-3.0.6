import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  bool isLoading = false;

  void signIn() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void signUp() {}
  void recoverPass() {}
  bool isLoggedIn() {
    return false;
  }
}
