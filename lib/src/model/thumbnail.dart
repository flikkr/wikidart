import 'dart:convert';

class Thumbnail {
  final String? source;
  final int? width;
  final int? height;

  const Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'width': width,
      'height': height,
    };
  }

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      source: map['source'],
      width: map['width'],
      height: map['height'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) => Thumbnail.fromMap(json.decode(source));

  @override
  String toString() => 'Thumbnail(source: $source, width: $width, height: $height)';
}
