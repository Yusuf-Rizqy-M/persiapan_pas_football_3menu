import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../model/model_bola.dart';

class MyRecentlyPlayed extends StatelessWidget {
  final String album;
  final Color albumColor;
  final FontWeight albumWeight;
  final String genre;
  final Color genreColor;
  final FontWeight genreWeight;
  final String image;
  final double fontSizeSubTitle;
  final double fontSize;
  final double borderRadius;
  final double widthImage;
  final double heightImage;

  MyRecentlyPlayed({
    required this.album,
    required this.genre,
    required this.image,
    required this.albumWeight,
    required this.albumColor,
    required this.genreColor,
    required this.genreWeight,
    required this.fontSizeSubTitle,
    required this.borderRadius,
    required this.widthImage,
    required this.heightImage,
    required this.fontSize,
  });


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: widthImage,
              height: heightImage,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            album,
            style: TextStyle(
              fontWeight: albumWeight,
              color: albumColor,
              fontSize: fontSize,
            ),
          ),
          Text(
            genre,
            style: TextStyle(
              fontSize: fontSizeSubTitle,
              fontWeight: genreWeight,
              color: genreColor,
            ),
          ),
        ],
      ),
    );
  }
}
