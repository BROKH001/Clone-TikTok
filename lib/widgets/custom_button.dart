

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String title;
  final void Function()? onTap;
  const CustomButton({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          onPressed: onTap,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
