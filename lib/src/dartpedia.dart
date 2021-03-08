import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/search/search_response.dart';
import 'model/wiki_response.dart';

/// The search function to use during the wiki search
enum SearchType {
  nearmatch,
  text /*title*/
}

class Dartpedia {
  static const String _baseUrl = 'en.wikipedia.org';

  /// Retrieve a random Wikipedia page
  ///
  /// refer to
  static Future<WikiResponse?> random() async {
    throw UnimplementedError();
  }

  /// use https://en.wikipedia.org/w/api.php?action=help
  static Future<WikiResponse?> summary(int pageId) async {
    var res = await http.get(Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/w/api.php',
      queryParameters: {
        'action': 'query',
        'redirects': 1,
        'format': 'json',
        'prop': 'extracts|description|langlinks',
        'exintro': '',
        'explaintext': '',
        'pageids': pageId,
      },
    ));

    if (res.statusCode == 200) {
      return WikiResponse.fromJson(res.body);
    } else {
      return null;
    }
  }

  /// Start a search query from the provided [query].
  ///
  /// [limit] value will set the limit of the number of results returned.
  /// Use [offset] for pagination (set to 0 by default to get the first page of results).
  ///
  /// refer to https://www.mediawiki.org/wiki/API:Search#GET_request
  static Future<SearchResponse?> searchQuery(
    String query, {
    int limit = 10,
    int offset = 0,
    SearchType searchType = SearchType.nearmatch,
  }) async {
    if (query.isEmpty) throw ArgumentError.notNull();
    var res = await http.get(Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/w/api.php',
      queryParameters: {
        'action': 'query',
        'list': 'search',
        'srsearch': query,
        'format': 'json',
        'srlimit': '$limit',
        'sroffset': '$offset',
        'srwhat': searchType.toString().split('.').last,
      },
    ));

    if (res.statusCode == 200 && json.decode(res.body)['query'] != null) {
      return SearchResponse.fromJson(res.body);
    }
  }

  static Future<http.Response?> debugLink(String url) async {
    return await http.get(Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/w/api.php',
      queryParameters: {
        'action': 'query',
        'format': 'json',
        'srsearch': 'Nelson',
      },
    ));
  }
}
