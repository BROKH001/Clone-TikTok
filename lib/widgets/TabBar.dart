import 'package:flutter/material.dart';

class BuildTabBar extends StatefulWidget {
  final double? like;
  final String? pic;
  final double? comment;
  final double? save;
  final double? share;
  final String? image;
  const BuildTabBar(
      {super.key,
      required this.like,
      this.comment,
      this.save,
      this.share,
      this.image,
      this.pic});

  @override
  State<BuildTabBar> createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildProfile(
          () {
            debugPrint("Add Friend ...");
          },
        ),
        _buildIcon("${widget.like}K", Icons.favorite, () {
          debugPrint("Like");
        }),
        _buildIcon("${widget.comment}K", Icons.comment, () {
          debugPrint("comment");
        }),
        _buildIcon("${widget.save}K", Icons.bookmark, () {
          debugPrint("Save");
        }),
        _buildIcon("${widget.share}K", Icons.share, () {
          debugPrint("Share");
        }),
        const SizedBox(height: 10),
        _buildPlayList(),
      ],
    );
  }

  Widget _buildIcon(String label, IconData icon, void Function()? onTap) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      spacing: 0,
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
              color: Colors.transparent,
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
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: NetworkImage("${widget.pic}"),
                  fit: BoxFit.cover),
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
        color: Colors.transparent,
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
        image: DecorationImage(
            image: NetworkImage("${widget.pic}"), fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }
}
