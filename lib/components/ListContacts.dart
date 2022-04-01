import 'package:facebook_interface/components/ButtonImagePerfil.dart';
import 'package:facebook_interface/components/ButtonWithOnlyPerfil.dart';
import 'package:facebook_interface/components/PerfilImage.dart';
import 'package:facebook_interface/models/User.dart';
import 'package:flutter/material.dart';

class ListContacts extends StatelessWidget {

  final List<User> users;

  const ListContacts({Key? key,
                    required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded (
                child: Text(
                    "Contatos",
                    style:
                      TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.video_call)
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search)
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz)
              )
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: users.length,
            itemBuilder: (context, index){
              User user = users[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: ButtonWithOnlyPerfil(user: user,  onTap: () {}),
              );
            }
          )
        )
    ])
    );
  }
}
