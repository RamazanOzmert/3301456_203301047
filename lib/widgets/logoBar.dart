import 'package:flutter/material.dart';

class LogoBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _LogoBar createState() => _LogoBar();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LogoBar extends State<LogoBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      //automaticallyImplyLeading: false, //no navigator button
      title: const Text(
        'Market',
      ),
      centerTitle: true,
      backgroundColor: Color(0xFF5AA9E6),
    );
  }
}
