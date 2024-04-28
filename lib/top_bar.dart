import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFE5E5E5),
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF4b39ef),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
