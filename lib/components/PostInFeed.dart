import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/PerfilImage.dart';
import 'package:facebook_interface/models/Post.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostInFeed extends StatelessWidget {

  final Post post;

  const PostInFeed({Key? key,
                    required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column (
        children: [

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderPost(post: post),
                Text(post.description),
              ],
            ),
          ),

          Padding (
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(imageUrl: post.imageUrl),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),

            child: StatisticsAboutPost(post: post),
          )
        ],
      )
    );
  }
}

class StatisticsAboutPost extends StatelessWidget {

  final Post post;

  const StatisticsAboutPost({Key? key,
                            required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: CollorPallet.BlueFacebook,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4),
            Expanded(child: Text("${post.likes}", style: TextStyle(color: Colors.grey[700]))),
            SizedBox(width: 4),
            Text("${post.comments} comentários", style: TextStyle(color: Colors.grey[700])),
            SizedBox(width: 4),
            Text("${post.shares} compartilhamentos", style: TextStyle(color: Colors.grey[700]))

          ],
        ),
        Divider(thickness: 1.2),
        Row(
          children: [
            ButtonPost(icon: Icon(LineIcons.thumbsUpAlt, color: Colors.grey[700]) , text: "Curtir", onTap: (){}),
            ButtonPost(icon: Icon(LineIcons.alternateCommentAlt, color: Colors.grey[700]) , text: "Comentar", onTap: (){}),
            ButtonPost(icon: Icon(LineIcons.share, color: Colors.grey[700]) , text: "Compartilhar", onTap: (){})
          ],
        )
      ],
    );
  }
}

class ButtonPost extends StatelessWidget {

  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const ButtonPost({Key? key,
                    required this.icon,
                    required this.text,
                    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Material(
      child: InkWell(onTap: onTap, child: Container(
        child: Row(
          children: [
            icon,
            SizedBox(width: 4),
            Text(text, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold))
          ],
        ),
      )),
    ));
  }
}


class HeaderPost extends StatelessWidget {

  final Post post;

  const HeaderPost({Key? key,
                  required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PerfilImage(urlImage: post.user.imageUrl, wasVisualized: true),

        SizedBox(width: 8),

        Expanded(child:
          Column(
            children: [
              Text(post.user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("${post.timeAgo}", style: TextStyle(color: Colors.grey)),
                  Icon(Icons.public)
                ],
              )
            ],
          )
        ),

        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}
