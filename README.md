# Wikidart

[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
<!-- [![Pub](https://img.shields.io/pub/v/gap.svg)](https://pub.dartlang.org/packages/emoji) -->

A simple wrapper for [WikiMedia API](https://en.wikipedia.org/w/api.php) written in Dart. Allows you to query and retrieve Wikipedia page information.

## Usage

A typical usage example:

```dart
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
```

## Features

- [x] Search by title
- [x] Get summary by pageid
- [ ] Random
- [x] Set page language

## Contributions

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/flikkr/wikidart/issues
