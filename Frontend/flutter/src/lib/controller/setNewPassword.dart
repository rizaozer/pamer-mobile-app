import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/controller/setNewpasswordController.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SetNewPasswordController _snpController =
        Get.put(SetNewPasswordController());
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Center(
        child: Container(
          height: Get.height / 2,
          width: Get.width * .89,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Visibility(
                    visible: !_snpController.isPasswordMatch.value &&
                        _snpController.isBothFieldsFilled.value,
                    child: const Text(
                      'Password is not match',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _snpController.passwordController,
                  onChanged: (value) {
                    _snpController.checkPasswordMatch();
                    _snpController
                        .checkBothFieldsFilled(); // Her iki alanda da metin girişi yapılıp yapılmadığını kontrol et
                  },
                  style: const TextStyle(color: Colors.cyan),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFFD1C1C1)),
                    hintText: '********',
                    hintStyle: TextStyle(color: Colors.cyan),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFFC1C1C1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _snpController.rePasswordController,
                  onChanged: (value) {
                    _snpController.checkPasswordMatch();
                    _snpController
                        .checkBothFieldsFilled(); 
                  },
                  style: const TextStyle(color: Colors.cyan),
                  decoration: const InputDecoration(
                    labelText: 'Re-password',
                    labelStyle: TextStyle(color: Color(0xFFD1C1C1)),
                    hintText: '********',
                    hintStyle: TextStyle(color: Colors.cyan),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFFC1C1C1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: Get.width / 3,
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
