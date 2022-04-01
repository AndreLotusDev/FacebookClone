import 'package:facebook_interface/components/ButtonWithOnlyPerfil.dart';
import 'package:facebook_interface/models/Models.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListOptions extends StatelessWidget {

  final User user;

  final List<List> _options = const [
    [LineIcons.userFriends, CollorPallet.BlueFacebook , "Amigos"],
    [LineIcons.facebookMessenger, CollorPallet.BlueFacebook, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.users, CollorPallet.BlueFacebook, 'Grupos'],
    [Icons.storefront_outlined, CollorPallet.BlueFacebook, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais'],
  ];

  const ListOptions({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: 1 + _options.length,
          itemBuilder: (context, indice){

            if( indice == 0 ){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: ButtonWithOnlyPerfil(
                  user: user,
                  onTap: (){},
                ),
              );
            }

            List item = _options[indice - 1];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Opcao(
                icone: item[0],
                cor: item[1],
                texto: item[2],
                onTap: (){},
              ),
            );
          }
      ),
    );
  }
}

class Opcao extends StatelessWidget {

  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback onTap;

  const Opcao({
    Key? key,
    required this.icone,
    required this.cor,
    required this.texto,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor, size: 35,),
          SizedBox(width: 4,),
          Flexible(
              child: Text(texto, style: TextStyle(
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



