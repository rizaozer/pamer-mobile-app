import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class UserRegistrationPage extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  void registerUser() async {
    final url = Uri.parse('http://192.168.1.113:5001/register');
    var hashPassword =
        sha256.convert(utf8.encode(passwordController.text)).toString();
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': userIdController.text,
        'identity_number': identityNumberController.text,
        'password': hashPassword,
        'fullname': fullnameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'activation': 0,
        'password_reset': 'null',
        'password_reset_validation': 0,
        'age': ageController.text,
        'gender': genderController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Registered!');
    } else {
      print('Error occur!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
              ),
              TextField(
                controller: identityNumberController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: fullnameController,
                decoration: InputDecoration(labelText: 'Full name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'e-post'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Tel'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerUser,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
