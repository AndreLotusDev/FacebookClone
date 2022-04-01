import 'package:facebook_interface/components/PerfilImage.dart';
import 'package:facebook_interface/models/Models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithOnlyPerfil extends StatelessWidget {

  final User user;
  final VoidCallback onTap;

  const ButtonWithOnlyPerfil({
    Key? key,
    required this.user,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PerfilImage(urlImage: user.imageUrl, wasVisualized: true,),
          SizedBox(width: 4,),
          Flexible(
              child: Text(user.name, style: TextStyle(
                fontSize: 16,
              ),
                overflow: TextOverflow.ellipsis,
              )
          )
        ],
      ),
    );
  }
}