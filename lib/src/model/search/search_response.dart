import 'dart:convert';

import 'package:dartpedia/src/model/search/search_info.dart';

import 'search_result.dart';

// Format: https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=Nelson%20Mandela&utf8=&format=json
/// This class holds the response from the search query.
class SearchResponse {
  final List<SearchResult>? results;
  final int? offset;
  final SearchInfo? searchInfo;

  const SearchResponse({
    this.results,
    this.offset,
    this.searchInfo,
  });

  SearchResponse copyWith({
    List<SearchResult>? results,
    int? offset,
    SearchInfo? searchInfo,
  }) {
    return SearchResponse(
      results: results ?? this.results,
      offset: offset ?? this.offset,
      searchInfo: searchInfo ?? this.searchInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x.toMap()).toList(),
      'offset': offset,
      'searchInfo': searchInfo?.toMap(),
    };
  }

  factory SearchResponse.fromMap(Map<String, dynamic> map) {
    return SearchResponse(
      results: map['query']['search'] == null
          ? null
          : List<SearchResult>.from(
              map['query']['search']?.map((x) => SearchResult.fromMap(x))),
      offset: map['offset'],
      searchInfo: map['query']['searchinfo'] == null
          ? null
          : SearchInfo.fromMap(map['query']['searchinfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResponse.fromJson(String source) =>
      SearchResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchResponse(results: $results, offset: $offset, searchInfo: $searchInfo)';
}
