import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final void Function()? onTap;
  final void Function()? searchTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Key? form;

  CustomAppBar({
    Key? key,
    this.onTap,
    this.searchTap,
    this.onChanged,
    this.controller,
    this.validator,
    this.form,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(150),
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 42,
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
                      onChanged: onChanged,
                      controller: controller,
                      validator: validator,
                      key: form,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 7),
                        hintText: "Search",
                        alignLabelWithHint: true,
                        hintStyle: const TextStyle(color: Colors.grey),
                        helperStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: const Color(0xff0F1122),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: searchTap,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
}
