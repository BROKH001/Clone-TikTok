import 'package:flutter/material.dart';
import 'package:ui_tik_tok/models/PostModel.dart';
import 'package:ui_tik_tok/pages/friends_page.dart';
import 'package:ui_tik_tok/pages/search_page.dart';
import 'package:ui_tik_tok/widgets/custom_TabBar.dart';
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
      // appBar: AppBar(),
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
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white24, width: 2)),
        ),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconButton(Icons.home, "Home", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
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
                height: double.infinity,
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
            top: 45,
            left: 50,
            right: 50,
            child: Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  CustomTabBar(
                    title: "Following",
                    isSelected: false,
                    onTap: () {},
                  ),
                  CustomTabBar(
                    title: "For You",
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            right: 10,
            child: IconButton(
              onPressed: () {
                print("Search ...");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 5,
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
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
