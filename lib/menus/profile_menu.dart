import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widget/my_button.dart';
import '../widget/my_image.dart';
import '../widget/my_text.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyImage(
                      imageName: 'assets/images/azazel.jpg',
                      width: 120,
                      height: 120,
                      borderRadius: 10,
                      margin: EdgeInsets.only(top: 20),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          hintText: 'Yusuf',
                          fontSize: 26,
                          colors: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            MyButton(
                              textButton: 'Edit profile',
                              backgroundColor: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () {},
                              borderRadius: BorderRadius.circular(20),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              margin: EdgeInsets.only(right: 3),
                            ),
                            SizedBox(width: 10),
                            // Promo Button
                            MyButton(
                              textButton: 'Albums',
                              backgroundColor: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {},
                              borderRadius: BorderRadius.circular(20),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              margin: EdgeInsets.only(right: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      hintText: 'Pilihan fitur',
                      fontSize: 14,
                      colors: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      hintText: 'Pesan kamu',
                      fontSize: 14,
                      colors: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.album,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      child: MyText(
                        hintText: 'Chat Bot',
                        fontSize: 14,
                        colors: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: MyButton(
                  margin: EdgeInsets.only(top: 200),
                  textButton: 'Logout',
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  borderRadius: BorderRadius.circular(20),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
