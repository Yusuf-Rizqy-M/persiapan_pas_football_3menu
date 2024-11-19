import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_laliga/api_controller_laliga.dart';
import '../controller/task_controller.dart';
import '../widget/my_detail.dart';
import '../widget/my_image.dart';
import '../widget/my_text.dart';

class DetailLaliga extends StatelessWidget {
  final ApiControllerLaliga footballController = Get.put(ApiControllerLaliga());

  DetailLaliga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: MyText(
          hintText: "Klub Liga Spanish",
          fontSize: 20,
          colors: Colors.black,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: MyImage(
              imageName: "assets/images/azazel.jpg",
              width: 40,
              height: 40,
              borderRadius: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            // Albums List
            Expanded(
              child: Obx(() {
                if (footballController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: footballController.postList.length,
                  itemBuilder: (context, index) {
                    final post = footballController.postList[index];

                    // Menggunakan MyDetail untuk menampilkan detail album
                    return MyDetail(
                      image: post.strBadge,
                      team: post.strTeam,
                      // artist: post.strArtist,
                      // description: post.strDescriptionEN,
                      stadium: post.strStadium,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
