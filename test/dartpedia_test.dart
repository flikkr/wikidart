import 'package:dartpedia/dartpedia.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for the summary wiki function', () {
    test('Getting the summary from Nelson Mandela wiki page', () async {
      var res = await Dartpedia.summary(30071);
      expect(res, isNot(equals(null)));
    });

    test('Retrieving the summary using an invalid page id', () async {
      var res = await Dartpedia.summary(999);
      expect(res, equals(null));
    });
  });

  group('Test group for the search wiki function', () {
    test('Query an valid string should not return null', () async {
      var res = await Dartpedia.searchQuery('Mandela');
      expect(res, isNot(equals(null)));
    });

    test('Query an invalid string should return null', () async {
      var res = await Dartpedia.searchQuery('asdasdasd');
      expect(res, equals(null));
    });
  });

  group('Test group for the random wiki function', () {
    test('Querying should never return null', () async {
      fail('Not implemented');
    });
  });
}
