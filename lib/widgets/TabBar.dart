import 'package:flutter/material.dart';
import 'package:ui_tik_tok/models/PostModel.dart';

class BuildTabBar extends StatefulWidget {
  const BuildTabBar({super.key});

  @override
  State<BuildTabBar> createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar> {
  late PostModel postModel = PostModel(
      likes: 100,
      comments: 1.5,
      shares: 1.5,
      save: 40,
      content: "",
      time: "",
      image: Image(image: NetworkImage("")));

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildProfile(
          () {
            print("Add Friend ...");
          },
        ),
        _buildIcon("${postModel.likes}K", Icons.favorite, () {
          print("Like");
        }),
        _buildIcon("${postModel.comments}K", Icons.comment, () {
          print("comment");
        }),
        _buildIcon("${postModel.save}K", Icons.save, () {
          print("Save");
        }),
        _buildIcon("${postModel.shares}K", Icons.share, () {
          print("Share");
        }),
        _buildPlayList(),
      ],
    );
  }

  Widget _buildIcon(String label, IconData icon, void Function()? onTap) {
    return Column(
      children: [
        IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              size: 40,
              color: Colors.white,
            )),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildProfile(void Function()? onTap) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border(
              bottom: BorderSide(
                  width: 3, color: Colors.cyan, style: BorderStyle.solid),
              top: BorderSide(
                  width: 3, color: Colors.cyan, style: BorderStyle.solid),
              left: BorderSide(
                  width: 3, color: Colors.cyan, style: BorderStyle.solid),
              right: BorderSide(
                  width: 3, color: Colors.cyan, style: BorderStyle.solid),
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                    width: 2, color: Colors.black, style: BorderStyle.solid),
                top: BorderSide(
                    width: 2, color: Colors.black, style: BorderStyle.solid),
                left: BorderSide(
                    width: 2, color: Colors.black, style: BorderStyle.solid),
                right: BorderSide(
                    width: 2, color: Colors.black, style: BorderStyle.solid),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30,
              width: 30,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayList() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        border: Border(
          bottom: BorderSide(
              width: 2, color: Colors.white, style: BorderStyle.solid),
          top: BorderSide(
              width: 2, color: Colors.white, style: BorderStyle.solid),
          left: BorderSide(
              width: 2, color: Colors.white, style: BorderStyle.solid),
          right: BorderSide(
              width: 2, color: Colors.white, style: BorderStyle.solid),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
