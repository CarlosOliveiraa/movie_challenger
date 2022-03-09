import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double width;
  final double height;

  const CustomAppBar({Key? key,  this.width = 309,  this.height = 42})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: const [
          Icon(Icons.menu, color: Colors.white,),
          TextField(),
          Icon(Icons.search, color: Colors.white,),
          Icon(Icons.settings, color: Colors.white,),
        ],
      ),
    );
  }
}
