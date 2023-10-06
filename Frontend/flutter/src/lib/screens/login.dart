import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reminder/controller/loginController.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    final LoginController _loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Center(
        child: Container(
          width: Get.width * .89,
          height: Get.height / 1.7,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 184, 183, 183),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Reminder',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(
                      _loginController.errorMessage.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  style: const TextStyle(color: Colors.cyan),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _loginController.passwordController,
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
                        borderSide: BorderSide(color: Colors.cyan)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      _loginController.login();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/forgetpassword');
                    },
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
