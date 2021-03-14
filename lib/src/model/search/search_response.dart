import 'dart:convert';

import 'package:dartpedia/src/model/search/search_info.dart';

import 'search_result.dart';

/// This class holds the response from the search query.
/// 
/// [success] is indicative of whether the query was a success (i.e. no error was thrown).
/// [results] contains the query results for the given text. [offset] is used for pagination and
/// should be provided in the search function as a parameter. [searchInfo] will contain
/// general information about the query. [rawResponse] stores the raw json body response. 
class SearchResponse {
  final bool success;
  final List<SearchResult>? results;
  final int? offset;
  final SearchInfo? searchInfo;
  final Map<String, dynamic> rawResponse;

  const SearchResponse({
    required this.success,
    required this.rawResponse,
    this.results,
    this.offset,
    this.searchInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x.toMap()).toList(),
      'offset': offset,
      'searchInfo': searchInfo?.toMap(),
      'success': success,
      'rawResponse': rawResponse,
    };
  }

  factory SearchResponse.fromMap(Map<String, dynamic> map) {
    return SearchResponse(
      results: map['query']?['search'] == null
          ? null
          : List<SearchResult>.from(
              map['query']?['search']?.map((x) => SearchResult.fromMap(x))),
      offset: map['offset'],
      searchInfo: map['query']?['searchinfo'] == null
          ? null
          : SearchInfo.fromMap(map['query']?['searchinfo']),
      rawResponse: map,
      success: map['query']?['search'] != null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResponse.fromJson(String source) =>
      SearchResponse.fromMap(json.decode(source));

  @override
  String toString() => 'SearchResponse(${toMap().toString()})';
}
