import 'package:flutter/material.dart';

class CustomCategoriesButtom extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final void Function()? onTap;
  final Color? color;

  const CustomCategoriesButtom(
      {Key? key, this.width = 100, this.height = 50, required this.text, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
        width: width,
        height: height,
        decoration:  BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            )),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
