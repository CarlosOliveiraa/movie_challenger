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
                  size: 25,
                )),
            SizedBox(
              width: 300,
              child: TextFormField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    hintText: "Search",
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(color: Colors.white),
                    helperStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
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
