import 'package:dartpedia/src/dartpedia.dart';
import 'package:test/test.dart';

void main() {
  test('Getting the summary from the API', () async {
    // var res = await Dartpedia.summary('Computer');
    // print(res?.extract);
  });

  test('Wikipedia search query', () async {
    var res = await Dartpedia.searchQuery('Mandela');
    print(res?.results);
  });

  test('Using link for debug', () async {
    var res = await Dartpedia.debugLink(
        'en.wikipedia.org/w/api.php?action=query&srsearch=Nelson%20Mandela&utf8=&format=json');

    print(res?.body);
  });
}
