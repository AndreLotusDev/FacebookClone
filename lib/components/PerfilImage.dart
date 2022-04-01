import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';
    
class PerfilImage extends StatelessWidget {

  final String urlImage;
  final bool wasVisualized;

  const PerfilImage({Key? key,
                    required this.urlImage,
                    this.wasVisualized = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: wasVisualized ? Colors.grey : CollorPallet.BlueFacebook,
      child: CircleAvatar (
        radius: 20,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),

    );
  }
}
