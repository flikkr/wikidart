import 'package:http/http.dart' as http;

import 'model/search_response.dart';
import 'model/wiki_response.dart';

enum SearchType { nearmatch, text, title }

class ApiService {
  static const String baseUrl = 'https://en.wikipedia.org/api/rest_v1/';
  static const String wikipediaBaseUrl = 'https://en.wikipedia.org';

  Future<WikiResponse> getPageSummary(String title) async {
    if (title.isEmpty) throw ArgumentError.notNull();
    var res = await http.get(Uri.https(baseUrl, 'pages/summary/$title'));

    if (res.statusCode == 200) {
      return WikiResponse.fromJson(res.body);
    } else {
      return null;
    }
  }

  Future<WikiResponse> getRandomPage() async {
    throw UnimplementedError();
  }

  Future<SearchResponse> searchQuery(
    String query, {
    int limit,
    int offset,
    SearchType searchType,
  }) async {
    if (query.isEmpty) throw ArgumentError.notNull();
    var res = await http.get(Uri(
      scheme: 'https',
      host: wikipediaBaseUrl,
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
    
    throw UnimplementedError();
  }
}
