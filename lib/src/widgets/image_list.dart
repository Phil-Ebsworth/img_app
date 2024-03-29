import 'package:bildverarbeitung/src/widgets/image_details_view.dart';
import 'package:flutter/material.dart';
import 'package:bildverarbeitung/global_variables.dart';
import 'package:bildverarbeitung/src/widgets/image_card.dart';

class ImagesList extends StatefulWidget {
  const ImagesList({Key? key}) : super(key: key);

  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.75,
                    ),
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ImageDetailsView(
                                  title: image['title'] as String,
                                  imageUrl: image['imageUrl'] as String,
                                  id: image['id'] as String,
                                );
                              },
                            ),
                          );
                        },
                        child: ImageCard(
                          title: image['title'] as String,
                          imageUrl: image['imageUrl'] as String,
                          id: image['id'] as String,
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return GestureDetector(
                        onTap: () {},
                        child: ImageCard(
                          title: image['title'] as String,
                          imageUrl: image['imageUrl'] as String,
                          id: image['id'] as String,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
