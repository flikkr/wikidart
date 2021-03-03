import 'package:http/http.dart' as http;

import 'model/search/search_response.dart';
import 'model/wiki_response.dart';

enum SearchType { nearmatch, text, title }

class ApiService {
  static const String _baseUrl = 'en.wikipedia.org';

  // refer to https://en.wikipedia.org/api/rest_v1/#/Page%20content/get_page_
  static Future<WikiResponse?> getPageSummary(String title) async {
    if (title.isEmpty) throw ArgumentError.notNull();
    var res =
        await http.get(Uri.https(_baseUrl, 'api/rest_v1/page/summary/$title'));

    if (res.statusCode == 200) {
      return WikiResponse.fromJson(res.body);
    } else {
      return null;
    }
  }

  static Future<WikiResponse?/*?*/> getRandomPage() async {
    throw UnimplementedError();
  }

  // refer to https://www.mediawiki.org/wiki/API:Search#GET_request
  static Future<SearchResponse?> searchQuery(
    String query, {
    int? limit,
    int? offset,
    SearchType? searchType,
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
        'srlimit': limit,
        'sroffset': offset,
        'srwhat': searchType.toString().split('.').last,
      },
    ));

    if (res.statusCode == 200) {
      return SearchResponse.fromJson(res.body);
    } else {
      return null;
    }
  }
}
