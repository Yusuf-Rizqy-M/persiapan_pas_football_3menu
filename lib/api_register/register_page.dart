import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persiapan_pas_football_3menu/api_register/register_controller.dart';
import '../widget/my_text.dart';
import '../widget/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 200,
              ),
              MyTextField(
                hintText: 'Username',
                controller: usernameController,
                icon: Icons.person_outline,
              ),
              MyTextField(
                hintText: 'Password',
                isPassword: true,
                controller: passwordController,
                icon: Icons.lock_outline,
              ),
              MyTextField(
                hintText: 'Full Name',
                controller: fullNameController,
                icon: Icons.face,
              ),
              MyTextField(
                hintText: 'Email',
                controller: emailController,
                icon: Icons.email,
              ),
              SizedBox(height: 20),
              Obx(() {
                return registerController.isLoading.value
                    ? CircularProgressIndicator()
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
                        ),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            fullNameController.text.isEmpty ||
                            emailController.text.isEmpty) {
                          // Tampilkan snackbar jika ada field yang kosong
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: MyText(
                                hintText: "Semua field harus diisi!",
                                fontSize: 16,
                                colors: Colors.white,
                              ),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                          return;
                        }

                        await registerController.register(
                          usernameController.text,
                          passwordController.text,
                          fullNameController.text,
                          emailController.text,
                        );

                        if (registerController.registerStatus.value != "Account Created Successfully") {
                          // Tampilkan pesan error di Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: MyText(
                                hintText: registerController.registerStatus.value,
                                fontSize: 16,
                                colors: Colors.white,
                              ),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        } else {
                          Get.offNamed('/login');
                        }
                      },
                      child: MyText(
                        hintText: 'Register',
                        fontSize: 15,
                        colors: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    hintText: "Already have account? ",
                    fontSize: 16,
                    colors: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed('/login');
                    },
                    child: MyText(
                      hintText: 'Login',
                      fontSize: 16,
                      colors: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}