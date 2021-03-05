import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/search/search_response.dart';
import 'model/wiki_response.dart';

enum SearchType { nearmatch, text, title }

class Dartpedia {
  static const String _baseUrl = 'en.wikipedia.org';

  // refer to https://en.wikipedia.org/api/rest_v1/#/Page%20content/get_page_
  static Future<WikiResponse?> summary(String title) async {
    if (title.isEmpty) throw ArgumentError.notNull();
    var res =
        await http.get(Uri.https(_baseUrl, 'api/rest_v1/page/summary/$title'));

    if (res.statusCode == 200) {
      return WikiResponse.fromJson(res.body);
    } else {
      return null;
    }
  }

  static Future<WikiResponse? /*?*/ > random() async {
    throw UnimplementedError();
  }

  /// refer to https://www.mediawiki.org/wiki/API:Search#GET_request
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

    if (res.statusCode == 200 && json.decode(res.body)['batchcomplete'] != '') {
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
