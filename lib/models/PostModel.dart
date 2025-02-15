import 'package:flutter/material.dart';

class PostModel {
  late final double? likes;
  late final double? comments;
  late final double? shares;
  late final double? save;
  late final String? content;
  late final String? time;
  late final Image? image;

  PostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.save,
    required this.content,
    required this.time,
    required this.image,
  });
}

List<PostModel> listPost = [
  PostModel(likes: 100, comments: 500, shares: 3518, save: 120, content: "Hello Bro", time: "2h ago", image: Image(image: NetworkImage(""))),
  PostModel(likes: 100, comments: 500, shares: 3518, save: 500, content: "Hello Ah dom", time: "3h ago", image: Image(image: NetworkImage(""))),
];