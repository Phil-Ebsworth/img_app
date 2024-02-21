import 'package:bildverarbeitung/changable_image.dart';
import 'package:flutter/material.dart';

class ImageDetailsView extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String id;
  final ChangableImage? changableImage;
  ImageDetailsView({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
  }) : changableImage = ChangableImage(imageUrl);

  @override
  State<ImageDetailsView> createState() => _ImageDetailsViewState();
}

class _ImageDetailsViewState extends State<ImageDetailsView> {
  @override
  Widget build(BuildContext context) {
    var url = widget.imageUrl;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: Center(
          child: Image.asset(url),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: 'B/W',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          onTap: (int index) {
            if (index == 0) {
              setState(() {
                widget.changableImage
                    ?.getSwImage()
                    .then((value) => url = value);
              });
            }
          },
        ));
  }
}
