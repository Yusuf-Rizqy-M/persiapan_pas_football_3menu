import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persiapan_pas_football_3menu/Api/Api_Controller.dart';
import 'package:persiapan_pas_football_3menu/widget/my_image_network.dart';

import '../controller/task_controller.dart';
import '../model/model_bola.dart';
import '../widget/my_text.dart';

class HomeMenuTablet extends StatelessWidget {
  final ApiController teamController = Get.put(ApiController());
  final TaskController favoriteController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() {
        if (teamController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }
        return ListView.builder(
          itemCount: teamController.postList.length,
          itemBuilder: (context, index) {
            final post = teamController.postList[index];

            if (post.strBadge.isEmpty) return SizedBox.shrink();

            return GestureDetector(
              // onTap: () => Get.toNamed('/musicdetail', arguments: post),
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyImageNetwork(
                        imageUrl: post.strBadge,
                        width: 65,
                        height: 65,
                        borderRadius: 8.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              hintText: post.strTeam,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              colors: Colors.black87,
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.stadium,
                                  color: Colors.blueAccent,
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                MyText(
                                  hintText: post.strStadium,
                                  fontSize: 14.0,
                                  colors: Colors.grey[600]!,
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Obx(() {
                                final isFavorite = favoriteController.isFavorite(ModelBola(strTeam: post.strTeam, strStadium: post.strStadium, strBadge: post.strBadge));
                                return IconButton(
                                  icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.blue,
                                  ),
                                  onPressed: () {
                                    if (isFavorite) {
                                      favoriteController.removeFavorite(ModelBola(strTeam: post.strTeam, strStadium: post.strStadium, strBadge: post.strBadge));
                                    } else {
                                      favoriteController.addFavorite(ModelBola(strTeam: post.strTeam, strStadium: post.strStadium, strBadge: post.strBadge));
                                    }
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
