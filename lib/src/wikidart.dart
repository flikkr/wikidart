import 'package:http/http.dart' as http;

import 'model/search/search_response.dart';
import 'model/wiki_response.dart';

/// The search function to use during the wiki search
enum SearchType {
  nearmatch,
  text,
  /*title*/
}

/// Allows you to search and query wikipedia pages.
class Wikidart {
  static const String _baseUrl = '.wikipedia.org';

  /// Retrieve a random Wikipedia page
  static Future<WikiResponse?> random() async {
    throw UnimplementedError();
  }

  /// Returns the summary of a wiki page
  ///
  /// Query by using a [pageId] which can be obtained from [searchQuery] function.
  /// Return null if no matching page is found.
  ///
  /// use https://en.wikipedia.org/w/api.php?action=help
  static Future<WikiResponse?> summary(
    int pageId, {
    int thumbnailWidth = 50,
    int thumbnailLimit = 1,
    String lang = 'en',
    Map<String, dynamic>? params,
  }) async {
    var res = await http.get(
      Uri(
        scheme: 'https',
        host: '$lang$_baseUrl',
        path: '/w/api.php',
        queryParameters: {
          'action': 'query',
          'redirects': '1',
          'format': 'json',
          'prop': 'extracts|description|langlinks',
          'exintro': '1',
          'explaintext': '1',
          'pageids': '$pageId',
          'pithumbsize': '$thumbnailWidth',
          'pilimit': '$thumbnailLimit',
          if (params != null) ...params,
        },
      ),
    );

    if (res.statusCode == 200) {
      return WikiResponse.fromJson(res.body);
    }
  }

  /// Start a search query from the provided [query].
  ///
  /// [limit] value will set the limit of the number of results returned.
  /// Use [offset] for pagination (set to 0 by default to get the first page of results).
  /// Return null if no matching page is found.
  ///
  /// refer to https://www.mediawiki.org/wiki/API:Search#GET_request
  static Future<SearchResponse?> searchQuery(
    String query, {
    int limit = 10,
    int offset = 0,
    SearchType searchType = SearchType.text,
    String lang = 'en',
    Map<String, dynamic>? params,
  }) async {
    if (query.isEmpty) throw ArgumentError.notNull();
    var res = await http.get(Uri(
      scheme: 'https',
      host: '$lang$_baseUrl',
      path: '/w/api.php',
      queryParameters: {
        'action': 'query',
        'list': 'search',
        'srsearch': query,
        'format': 'json',
        'srlimit': '$limit',
        'sroffset': '$offset',
        'srinfo': 'suggestion|totalhits',
        // 'srprop': 'snippet|titlesnippet|sectiontitle|categorysnippet',
        'srwhat': searchType.toString().split('.').last,
        if (params != null) ...params,
      },
    ));

    if (res.statusCode == 200) {
      return SearchResponse.fromJson(res.body);
    }
  }
}
