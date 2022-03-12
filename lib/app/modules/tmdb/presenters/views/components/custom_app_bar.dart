import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onTap;

  const CustomAppBar({Key? key, this.width = 309, this.height = 42, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: height,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            SizedBox(width: 300, child: TextFormField()),
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
