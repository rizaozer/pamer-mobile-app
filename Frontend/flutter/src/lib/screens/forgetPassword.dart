import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/controller/fpCodeController.dart';

class fpassCode extends StatelessWidget {
  fpassCode({super.key}) {
    _controller.startCountDown();
  }
  final ResetPasswordCodeController _controller =
      Get.put(ResetPasswordCodeController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Center(
        child: Container(
          height: Get.height / 2,
          width: Get.width * .89,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter the code we sent to your email address here',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Obx(() => Text(
                    '${_controller.countdown.value}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 25),
              Obx(() => Visibility(
                  visible: _controller.isResendButtonVisible.value,
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.isResendButtonVisible.value = false;
                      _controller.startCountDownAgain();
                    },
                    child: const Text('Resend Code'),
                  ))),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCodeTextField(
                      _controller.code1,
                      _focusNodes[0],
                      nextFocusNode: _focusNodes[1],
                    ),
                    _buildCodeTextField(
                      _controller.code2,
                      _focusNodes[1],
                      nextFocusNode: _focusNodes[2],
                      previousFocusNode: _focusNodes[0], // Geri silme için
                    ),
                    _buildCodeTextField(
                      _controller.code3,
                      _focusNodes[2],
                      nextFocusNode: _focusNodes[3],
                      previousFocusNode: _focusNodes[1], 
                    ),
                    _buildCodeTextField(
                      _controller.code4,
                      _focusNodes[3],
                      nextFocusNode: _focusNodes[4],
                      previousFocusNode: _focusNodes[2], 
                    ),
                    _buildCodeTextField(
                      _controller.code5,
                      _focusNodes[4],
                      nextFocusNode: _focusNodes[5],
                      previousFocusNode: _focusNodes[3], 
                    ),
                    _buildCodeTextField(
                      _controller.code6,
                      _focusNodes[5],
                      previousFocusNode: _focusNodes[4], 
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  String code = _controller.resetCode;
                  print('Password reset code: $code');
                  Get.toNamed('/setNewpassword');
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCodeTextField(RxString code, FocusNode currentFocusNode,
    {FocusNode? nextFocusNode, FocusNode? previousFocusNode}) {
  return Container(
    width: 40.0,
    height: 40.0,
    child: TextField(
      keyboardType: TextInputType.number,
      maxLength: 1,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 18.0),
      decoration: const InputDecoration(
        counterText: "",
        border: OutlineInputBorder(),
      ),
      focusNode: currentFocusNode,
      onChanged: (value) {
        code.value = value;
        if (value.isNotEmpty && nextFocusNode != null) {
          currentFocusNode.unfocus();
          nextFocusNode.requestFocus();
        } else if (value.isEmpty && previousFocusNode != null) {
          currentFocusNode.unfocus();
          previousFocusNode.requestFocus();
        }
      },
    ),
  );
}
