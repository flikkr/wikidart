import 'package:dartpedia/dartpedia.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for the summary wiki function', () {
    test('Getting the summary from Belgium wiki page', () async {
      var res = await Dartpedia.summary(3343);
      expect(res?.title, equals('Belgium'));
      expect(res?.success, isTrue);
    });

    test('Retrieving the summary using an invalid page id', () async {
      var res = await Dartpedia.summary(999);
      expect(res?.success, isFalse);
      expect(res?.extract, isNull);
    });
  });

  group('Test group for the search wiki function', () {
    test('Query an valid string should not return null', () async {
      var res = await Dartpedia.searchQuery('Belgium');
      expect(res?.results, isNotEmpty);
      expect(res?.success, isTrue);
    });

    test('Query an invalid string should be empty', () async {
      var res = await Dartpedia.searchQuery('asdasdasd');
      expect(res?.success, isTrue);
      expect(res?.results, isEmpty);
    });
  });

  group('Test group for the random wiki function', () {
    test('Querying should never return null', () async {
      fail('Not implemented');
    });
  });
}
