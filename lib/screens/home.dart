import 'package:facebook_interface/components/HistoryArea.dart';
import 'package:facebook_interface/components/ListContacts.dart';
import 'package:facebook_interface/components/ListOptions.dart';
import 'package:facebook_interface/components/PostArea.dart';
import 'package:facebook_interface/components/PostInFeed.dart';
import 'package:facebook_interface/data/DataWeb.dart';
import 'package:facebook_interface/models/Models.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:facebook_interface/utils/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:facebook_interface/components/ButtonCircle.dart';
import 'package:facebook_interface/data/DataWeb.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(mobile: HomeMobile(), desktop: HomeDesktop()),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          // expandedHeight: 250,
          floating: true,
          centerTitle: false,
          title: Text(
            "facebook",
            style: TextStyle(
                color: CollorPallet.BlueFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
            ),
          ),
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: (){},
            ),
            CircleButton(
              icon: LineIcons.facebookMessenger,
              iconSize: 30,
              onPressed: (){},
            )
          ],
        ),
        SliverToBoxAdapter(
          child: PostArea(
            user: actualUser,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: HistoryArea(
              user: actualUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index){
                      Post _post = posts[index];
                      return PostInFeed(
                          post: _post
                      );
                    },
                childCount: posts.length
            )
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [

          Flexible(
            flex: 2,
            child: Padding (
              padding: EdgeInsets.all(12),
              child: ListOptions(user: actualUser),
            )
          ),
          Spacer(),
          Flexible(
            flex: 5,
            child: CustomScrollView(
              slivers: [

                SliverToBoxAdapter(
                  child: PostArea(
                    user: actualUser,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: HistoryArea(
                      user: actualUser,
                      stories: stories,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index)
                      {
                        Post post = posts[index];

                        return PostInFeed(post: post);
                      },
                      childCount: posts.length
                  ),)
              ],)
          ),
          Spacer(),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListContacts(
                users: usersOnline
              ),
            )
          )

    ]);
  }
}

