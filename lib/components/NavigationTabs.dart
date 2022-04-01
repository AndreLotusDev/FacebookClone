import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';

class NavigationTabs extends StatelessWidget {

  final List<IconData> icons;
  final int indexTabSelected;
  final Function(int) onTap;
  final bool displaySymbolUnder;

  const NavigationTabs({Key? key,
                        required this.icons,
                        required this.indexTabSelected,
                        required this.onTap,
                        this.displaySymbolUnder = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: displaySymbolUnder ?
          BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: CollorPallet.BlueFacebook, width: 3)
              )
          )
          : BoxDecoration(
          border: Border(
              top: BorderSide(color: CollorPallet.BlueFacebook, width: 3)
          )
      ),
      tabs: icons.asMap().map((index, i) {
          return MapEntry(index, Tab(
            icon: Icon(i, color: indexTabSelected == index ? CollorPallet.BlueFacebook : Colors.black54)
          ));
      }).values.toList()
    );
  }
}
