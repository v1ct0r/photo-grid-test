class Photo {
  final String thumbUrl;
  final String regularUrl;

  Photo(
      this.thumbUrl,
      this.regularUrl,
  );

  factory Photo.fromJson(json) {
    final urls = json['urls'];
    return Photo(urls['regular'], urls['full']);
  }
}