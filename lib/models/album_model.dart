class AlbumModel {
  String? id;
  String? name;
  String? artist;
  String? url;
  String? imageUrl;
  String? streamable;

  AlbumModel(
      {this.id,
      this.name,
      this.artist,
      this.url,
      this.imageUrl,
      this.streamable});

  //for fetching data from the api
  AlbumModel.fromJson(Map<String, dynamic> json) {
    id = json['mbid'];
    name = json['name'];
    artist = json['artist'];
    url = json['url'];
    imageUrl = json["image"][1]["#text"];
    streamable = json['streamable'];
  }
  //for sending data to api use
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mbid'] = id;
    data['name'] = name;
    data['artist'] = artist;
    data['url'] = url;
    data['streamable'] = streamable;
    return data;
  }
}
