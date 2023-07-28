class PhotosModel {
  PhotosModel({
    required  this.albumId,
    required    this.id,
    required    this.title,
    required    this.url,
    required   this.thumbnailUrl,});

  PhotosModel.fromJson(dynamic json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
late  int albumId;
  late   int id;
  late   String title;
  late   String url;
  late   String thumbnailUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }

}