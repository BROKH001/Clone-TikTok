import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostModel {
  int? id;
  String? username;
  String? picProfile;
  double? likes;
  double? comments;
  double? shares;
  double? save;
  String? content;
  String? time;
  String? image;

  PostModel({
    required this.id,
    this.username,
    this.picProfile,
    this.likes,
    this.comments,
    this.shares,
    this.save,
    this.content,
    this.time,
    this.image,
  });
}

List<PostModel> listPost = [
  PostModel(
      id: 1,
      username: "Monkey D. Garp",
      picProfile: "https://c4.wallpaperflare.com/wallpaper/405/53/139/anime-one-piece-skull-skull-and-bones-wallpaper-preview.jpg",
      likes: 100,
      comments: 500,
      shares: 3.8,
      save: 120,
      content: "The Hero of Marin",
      time: "2h ago",
      image:
          "https://i.pinimg.com/736x/3f/2b/ed/3f2bed76717ee9e03aa4f69bd6b1d253.jpg"),
  PostModel(
      id: 2,
      username: "Gold D. Roger",
      picProfile: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6_8ED6krDEcJl8kI-NMOXXm62_pUwQbDe_xdsQrRmGGIJI6FsMhLm4eVWZzr4kU_x10E&usqp=CAU",
      likes: 100,
      comments: 500,
      shares: 3.5,
      save: 500,
      content: "The King of Pirate",
      time: "3h ago",
      image:
          'https://i.pinimg.com/736x/e4/c6/63/e4c6639a83368ae8ad9824732e5d87f2.jpg'),
];
