import 'dart:convert';

class SearchResult {
  final int pageId;
  final String title;
  final int size;
  final int wordcount;
  final String snippet;

  const SearchResult({
    required this.pageId,
    required this.title,
    required this.size,
    required this.wordcount,
    required this.snippet,
  });

  SearchResult copyWith({
    int? pageId,
    String? title,
    int? size,
    int? wordcount,
    String? snippet,
  }) {
    return SearchResult(
      pageId: pageId ?? this.pageId,
      title: title ?? this.title,
      size: size ?? this.size,
      wordcount: wordcount ?? this.wordcount,
      snippet: snippet ?? this.snippet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pageId': pageId,
      'title': title,
      'size': size,
      'wordcount': wordcount,
      'snippet': snippet,
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return SearchResult(
      pageId: map['pageId'],
      title: map['title'],
      size: map['size'],
      wordcount: map['wordcount'],
      snippet: map['snippet'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) => SearchResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchResult(pageId: $pageId, title: $title, size: $size, wordcount: $wordcount, snippet: $snippet)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SearchResult &&
      o.pageId == pageId &&
      o.title == title &&
      o.size == size &&
      o.wordcount == wordcount &&
      o.snippet == snippet;
  }

  @override
  int get hashCode {
    return pageId.hashCode ^
      title.hashCode ^
      size.hashCode ^
      wordcount.hashCode ^
      snippet.hashCode;
  }
}
