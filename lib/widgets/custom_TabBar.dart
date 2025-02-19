import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;
  const CustomTabBar(
      {super.key, required this.isSelected, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Text(
                    "  $title  ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : Colors.white70),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.transparent : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              shape: BoxShape.rectangle,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
