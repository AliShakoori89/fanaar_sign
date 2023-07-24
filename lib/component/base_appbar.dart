import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseAppBar({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
                right: 10
            ),
            child: Text(title,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 20,
                    color: Colors.white
                )),
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Colors.blue]),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}