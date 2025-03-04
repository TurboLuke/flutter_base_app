import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isTransparent;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.isTransparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(
        color: isTransparent ? Colors.transparent : Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      toolbarHeight: 90,
      // set background color to transparent if isTransparent is true else white
      backgroundColor: isTransparent ? Colors.transparent : Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.only(left: 15),
        alignment: Alignment.center,
        child: Material(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 35,
              height: 35,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 13,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          alignment: Alignment.center,
          child: Material(
            color: const Color.fromARGB(255, 243, 243, 243),
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {},
              child: const SizedBox(
                width: 35,
                height: 35,
                child: Icon(Icons.more_horiz, color: Colors.black, size: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
