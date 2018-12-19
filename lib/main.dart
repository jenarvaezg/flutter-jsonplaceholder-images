import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/image_list.dart';
import 'package:pics/models/image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pics',
      home: HomePage(title: "Let's see images!"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _imageId = 1;
  List<ImageModel> _images = [];
  static const _imageEndpoint = 'http://jsonplaceholder.typicode.com/photos';

  void _fetchImage() async {
    final response = await get('$_imageEndpoint/$_imageId');
    final parsedJson = json.decode(response.body);

    final img = ImageModel.fromJson(parsedJson);
    setState(() {
      _images.add(img);
      _imageId++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _images.isEmpty
            ? Center(
                child: Text('Tap the button to add images!'),
              )
            : ImageList(_images),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchImage,
        tooltip: 'Get an image',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
