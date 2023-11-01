import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/service/loginService.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.put(LoginService());
  final RxBool isLoggedIn = false.obs;
  final RxString errorMessage = ''.obs;
  final identityNumber = TextEditingController();
  final passwordController = TextEditingController();
  Map<String, dynamic>? get loggedInUser => _loginService.userData;

Future<void> login() async {
  try {
    final bool success = await _loginService.login(
        identityNumber.text, passwordController.text);
    if (success) {
      isLoggedIn.value = true;
      // Navigate to the Home screen
      Get.toNamed('/home');
    } else {
      // Clear any previous error message
      errorMessage.value = 'You have logged in incorrectly';
      // Set the error message for unsuccessful login
      errorMessage.value = _loginService.errorMessage;
    }
  } catch (e) {
    errorMessage.value = 'Login Error';
  }
}

  void logout() {
    isLoggedIn.value = false;
    Get.toNamed('/login');
  }

  @override
  void dispose() {
    identityNumber.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
