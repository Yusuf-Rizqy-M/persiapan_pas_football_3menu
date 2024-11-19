import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../widget/my_text.dart';

class FavoriteMenu extends StatelessWidget {
  final TaskController favoriteController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: MyText(
                  hintText: 'Favorite Club',
                  fontSize: 16,
                  colors: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (favoriteController.tasks.isEmpty) {
          return Center(
            child: MyText(hintText: 'Favorite club kosong', fontSize: 18, colors: Colors.black)
          );
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: favoriteController.tasks.length,
          itemBuilder: (context, index) {
            final favorite = favoriteController.tasks[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      favorite.strBadge,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favorite.strTeam,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          favorite.strStadium,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.white, size: 20),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Konfirmasi'),
                            content: Text('Apakah Anda yakin ingin menghapus ${favorite.strTeam} dari favorit?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Tutup dialog
                                },
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  favoriteController.removeFavorite(favorite); // Hapus item
                                  Navigator.of(context).pop(); // Tutup dialog
                                },
                                child: Text('Hapus'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
