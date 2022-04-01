import 'package:facebook_interface/components/NavigationTabs.dart';
import 'package:facebook_interface/components/TabsDesktop.dart';
import 'package:facebook_interface/data/DataWeb.dart';
import 'package:facebook_interface/utils/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'home.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final List<Widget> _screens = [
    Home(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.blue,
    ),
    Scaffold(
      backgroundColor: Colors.red,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    )
  ];

  List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  int _currentTabSelected = 0;

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: isDesktop ? PreferredSize(
              child: TabsDesktop(
                user: actualUser,
                icons: _icons,
                currentTabSelected: _currentTabSelected,
                onTap: (index) {
                setState(() {
                  _currentTabSelected = index;
                });}
              ),
              preferredSize: Size(size.width, 100)
          ) : null,
          body: TabBarView(
            children: _screens
          ),
          bottomNavigationBar: isDesktop ? null : NavigationTabs(
            icons: _icons,
            indexTabSelected: _currentTabSelected,
            onTap: (index) {
              setState(() {
                _currentTabSelected = index;
              });
            }
          ),
        )
    );
  }
}
