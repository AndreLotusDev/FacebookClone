import 'User.dart';

class Post {

  User user;
  String description;
  String timeAgo;
  String imageUrl;
  int likes;
  int comments;
  int shares;

  Post({
    required this.user,
    required this.description,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares
  });

}