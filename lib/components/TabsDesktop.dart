import 'package:facebook_interface/components/ButtonImagePerfil.dart';
import 'package:facebook_interface/components/NavigationTabs.dart';
import 'package:facebook_interface/models/User.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TabsDesktop extends StatelessWidget {

  final User user;

  final List<IconData> icons;

  final int currentTabSelected;

  final Function(int) onTap;

  const TabsDesktop({Key? key,
                    required this.user,
                    required this.icons,
                    required this.currentTabSelected,
                    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0,2),
              blurRadius: 4
          )
        ]
      ),

      child: Row (
        children: [
          Expanded(
              child: Text(
                "facebook",
                style: TextStyle(
                  color: CollorPallet.BlueFacebook,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: -1.2
                ),
              )
          ),
          Expanded(
              child: NavigationTabs(icons: icons, indexTabSelected: currentTabSelected, onTap: onTap, displaySymbolUnder: true)
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonImagePerfil(user: user, onTap: () {})
                ],
              )
          )
        ],
      ),
    );
  }
}
