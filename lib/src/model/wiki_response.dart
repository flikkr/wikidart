import 'dart:convert';

import 'package:dartpedia/src/model/thumbnail.dart';

// Format:
// {
//   "titles": {
//     "canonical": "string",
//     "normalized": "string",
//     "display": "string"
//   },
//   "pageid": 0,
//   "extract": "string",
//   "extract_html": "string",
//   "thumbnail": {
//     "source": "string",
//     "width": 0,
//     "height": 0
//   },
//   "originalimage": {
//     "source": "string",
//     "width": 0,
//     "height": 0
//   },
//   "lang": "en",
//   "dir": "ltr",
//   "timestamp": {},
//   "description": "American poet",
//   "coordinates": {
//     "lat": 0,
//     "lon": 0
//   }
// }

class WikiResponse {
  final String? pageId;
  final String? type;
  final String? displayTitle;

  final Thumbnail? thumbnail;
  final Thumbnail? originalImage;

  final String? lang;
  final String? description;
  final String? coordinates;
  final String? extract;
  final String? extract_html;

  const WikiResponse({
    this.pageId,
    this.type,
    this.displayTitle,
    this.thumbnail,
    this.originalImage,
    this.lang,
    this.description,
    this.coordinates,
    this.extract,
    this.extract_html,
  });

  Map<String, dynamic> toMap() {
    return {
      'pageId': pageId,
      'type': type,
      'displayTitle': displayTitle,
      'thumbnail': thumbnail?.toMap(),
      'originalImage': originalImage?.toMap(),
      'lang': lang,
      'description': description,
      'coordinates': coordinates,
      'extract': extract,
      'extract_html': extract_html,
    };
  }

  factory WikiResponse.fromMap(Map<String, dynamic> map) {
    return WikiResponse(
      pageId: map['pageId'],
      type: map['type'],
      displayTitle: map['displayTitle'],
      thumbnail: Thumbnail.fromMap(map['thumbnail']),
      originalImage: Thumbnail.fromMap(map['originalImage']),
      lang: map['lang'],
      description: map['description'],
      coordinates: map['coordinates'],
      extract: map['extract'],
      extract_html: map['extract_html'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WikiResponse.fromJson(String source) =>
      WikiResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return toMap().toString();
  }
}
