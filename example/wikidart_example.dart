import 'package:wikidart/wikidart.dart';

Future<void> main() async {
  var res = await Wikidart.searchQuery('Google');
  var pageid = res?.results?.first.pageId;

  if (pageid != null) {
    var google = await Wikidart.summary(pageid);

    print(google?.title); // Returns "Google"
    print(google?.description); // Returns "American technology company"
    print(google?.extract); // Returns "Google LLC is an American multinational technology company that specializes in Internet-related..."
  }
}
