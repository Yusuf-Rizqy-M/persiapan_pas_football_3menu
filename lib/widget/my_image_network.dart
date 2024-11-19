import 'package:flutter/material.dart';

class MyImageNetwork extends StatelessWidget {
  final String imageUrl;
  final EdgeInsets? margin;
  final double width;
  final double height;
  final double? borderRadius;
  final BoxFit? fit;

  const MyImageNetwork({
    Key? key,
    required this.imageUrl,
    this.margin,
    required this.width,
    required this.height,
    this.borderRadius,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          image: DecorationImage(
            fit: fit,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
