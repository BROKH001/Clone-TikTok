import 'package:flutter/material.dart';
import 'package:ui_tik_tok/models/PostModel.dart';
import 'package:ui_tik_tok/pages/friends_page.dart';

import '../models/PostModel.dart';
import '../widgets/TabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostModel postModel;

  // PostModel get postModel => _postModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: _buildPageScrollView(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildNavigationBar() {
    return BottomAppBar(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.black,
      shadowColor: Colors.white38,
      height: 95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButton(Icons.home, "Home", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }),
          _buildIconButton(
              Icons.people_alt_outlined,
              "Friend",
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FriendsPage()))),
          _buildIconButton(
              Icons.add_box,
              "Content",
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FriendsPage()))),
          _buildIconButton(
              Icons.inbox,
              "Inbox",
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FriendsPage()))),
          _buildIconButton(
              Icons.person,
              "Profile",
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FriendsPage()))),
        ],
      ),
    );
  }

  Widget _buildPageScrollView() {
    return Container(
      height: double.maxFinite,
      color: Colors.black,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: listPost.length,
            physics: const BouncingScrollPhysics(),
            pageSnapping: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Center(
              child: Container(
                height: 800,
                width: double.infinity,
                decoration: BoxDecoration(
                  // image: DecorationImage(image: listPost[index].image!),
                ),
                child: Center(
                    child: Text(
                  "${listPost[index].time}",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 50,
            right: 50,
            child: Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  _buildTabBar("Following", () {
                    print("Following");
                  }),
                  _buildTabBar("For You", () {
                    print("For You");
                  }),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            right: 15,
            child: IconButton(
              onPressed: () {
                print("Search ...");
              },
              icon: Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: BuildTabBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String title, void Function()? onTap) {
    return Column(
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
              fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTabBar(String title, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
