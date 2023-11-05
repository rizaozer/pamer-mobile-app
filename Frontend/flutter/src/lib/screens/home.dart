import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/controller/loginController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LoginController _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userData = _loginController.loggedInUser;
    final bool hasUserData = userData != null;
    final String fullName = hasUserData ? userData['fullname'] : '';
    final String age = hasUserData ? userData['age'] : '';

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: Get.width,
              height: Get.height / 2.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/settings');
                            },
                            icon: const Icon(Icons.more_vert_outlined))
                            },
                            icon: const Icon(Icons.more_vert_outlined))
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'image'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    fullName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    age,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.width / 2.4,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Swipe to Edit Profile'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * .08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: Get.height / 1.7,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      const Text(
                        'Ongoing Course',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height / 7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(color: Colors.grey)),
                              child: Text(''),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
