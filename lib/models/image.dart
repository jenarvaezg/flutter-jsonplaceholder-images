class ImageModel {
  int id;
  String title;
  String url;

  ImageModel(this.id, this.url, this.title);
  
  ImageModel.fromJson(Map<String, dynamic> parsedJson){
    this
      ..id = parsedJson['id']
      ..url = parsedJson['url']
      ..title = parsedJson['title'];
  }

  String toString() => 'Image id: $id, title: $title, url: $url';
}