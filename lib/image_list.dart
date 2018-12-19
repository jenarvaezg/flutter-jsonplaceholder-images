import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pics/models/image.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> _images;

  ImageList(this._images);

  Widget _buildImage(BuildContext context, int index) {
    final image = _images[index];
    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              height: 350.0,
              width: 350.0,
              placeholder: kTransparentImage,
              image: image.url,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                image.title,
                textAlign: TextAlign.center
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _images.length,
      itemBuilder: _buildImage,
    );
  }
}
