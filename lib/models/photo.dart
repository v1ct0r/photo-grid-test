class Photo {
  final String id;
  final String thumbUrl;
  final String regularUrl;

  Photo(
      this.id,
      this.thumbUrl,
      this.regularUrl,
  );

  factory Photo.fromJson(json) {
    final urls = json['urls'];
    return Photo(json['id'], urls['regular'], urls['full']);
  }
}