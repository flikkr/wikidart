import 'package:dartpedia/src/api_service.dart';
import 'package:test/test.dart';

void main() {
  test('Getting the summary from the API', () async {
    var res = await ApiService.getPageSummary('Computer');
    print(res?.extract);
  });

  test('Wikipedia search query', () async {
    var res = await ApiService.getPageSummary('Computer');
    print(res?.extract);
  });

  group('A group of tests', () {
    // Awesome awesome;

    // setUp(() {
    //   awesome = Awesome();
    // });

    // test('First Test', () {
    //   expect(awesome.isAwesome, isTrue);
    // });
  });
}
