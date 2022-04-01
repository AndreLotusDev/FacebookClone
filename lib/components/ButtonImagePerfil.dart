import 'package:facebook_interface/components/PerfilImage.dart';
import 'package:facebook_interface/models/User.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'ButtonCircle.dart';

class ButtonImagePerfil extends StatelessWidget {

  final User user;
  final VoidCallback onTap;

  const ButtonImagePerfil({Key? key,
                          required this.user,
                          required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PerfilImage(urlImage: user.imageUrl, wasVisualized: true),
          SizedBox(width: 4),
          Flexible(child: Text(user.name, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis)),
          CircleButton(
            icon: Icons.search,
            iconSize: 30,
            onPressed: () {},
          ),

          CircleButton(
            icon: LineIcons.facebookMessenger,
            iconSize: 30,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
