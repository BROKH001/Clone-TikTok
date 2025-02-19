import 'package:flutter/material.dart';
import 'package:ui_tik_tok/models/PostModel.dart';
import 'package:ui_tik_tok/pages/search_page.dart';
import 'package:ui_tik_tok/widgets/custom_TabBar.dart';
import 'package:ui_tik_tok/widgets/custom_button.dart';
import '../widgets/TabBar.dart';

class HomePage extends StatefulWidget {
  PostModel? post;
  HomePage({super.key, this.post});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageScrollView(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildNavigationBar() {
    return BottomAppBar(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.black,
      shadowColor: Colors.white24,
      height: 95,
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white24, width: 2)),
        ),
        child: Row(
          spacing: 0,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              title: "Home",
              icon: Icons.home,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
            ),
            CustomButton(
              title: "Friends",
              icon: Icons.people_alt_outlined,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
            ),
            CustomButton(
              title: "Content",
              icon: Icons.add_box_rounded,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
            ),
            CustomButton(
              title: "Inbox",
              icon: Icons.inbox,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
            ),
            CustomButton(
              title: "Profile",
              icon: Icons.person,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
              },
            ),
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
        alignment: Alignment.center,
        children: [
          PageView.builder(
            itemCount: listPost.length,
            physics: const BouncingScrollPhysics(),
            pageSnapping: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  // image: DecorationImage(image: listPost[index].image!),
                  ),
              child: Stack(
                children: [
                  Center(
                    child: Image.network("${listPost[index].image}"),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: BuildTabBar(
                      pic: listPost[index].picProfile,
                      like: listPost[index].likes,
                      comment: listPost[index].comments,
                      save: listPost[index].save,
                      share: listPost[index].shares,
                      image: listPost[index].image,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 5, bottom: 0),
                      height: 100,
                      width: 320,
                      color: Colors.transparent,
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 30,
                            children: [
                              Text(
                                "${listPost[index].username}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    wordSpacing: 1.5),
                              ),
                              Text(
                                "${listPost[index].time}",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Text(
                            "${listPost[index].content}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                CustomTabBar(
                  title: "Following",
                  isSelected: false,
                  onTap: () {
                    debugPrint("Following");
                  },
                ),
                CustomTabBar(
                  title: "For You",
                  isSelected: true,
                  onTap: () {
                    debugPrint("For You");
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 5,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
