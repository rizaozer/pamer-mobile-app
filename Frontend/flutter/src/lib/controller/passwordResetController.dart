import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:reminder/service/forgetpassService.dart';

class ForgetPasswordController extends GetxController {
  final ResetpasswordService _rpservice = Get.put(ResetpasswordService());
  final TextEditingController emailController = TextEditingController();
  final RxBool isEmailValid = true.obs;
  var email = ''.obs;

  void validateEmail(isEmailValid) {
    isEmailValid = EmailValidator.validate(email.value);
  }

  void sendMail() async {
    bool isSent = await _rpservice.resetPassword(email.value);
    if (isSent) {
      print('Request has been sent.');
    } else {
      print(
          'Error occur when sending request error message: ${_rpservice.errorMessage}');
    }
  }
}
