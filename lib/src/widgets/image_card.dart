import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class ImageCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  const ImageCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      imageProvider: AssetImage(imageUrl),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      description: Text(
        'Description',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
