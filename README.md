# Dartpedia

[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
<!-- [![Pub](https://img.shields.io/pub/v/gap.svg)](https://pub.dartlang.org/packages/emoji) -->

A simple wrapper for WikiMedia API written in Dart. Allows you to query and retrieve Wikipedia page information.

## Usage

A simple usage example:

```dart
import 'package:dartpedia/dartpedia.dart';

main() {
  var res = await Dartpedia.searchQuery('Google');
  var google = await Dartpedia.summary(res?.results?.first.pageId);
  
  print(res?.title);        // Returns "Google"
  print(res?.description);  // Returns "American technology company"
  print(res?.extract);      // Returns "Google LLC is an American multinational technology company that specializes in Internet-related..."
}
```

## Features

- [x] Search by title
- [x] Get summary by pageid
- [ ] Random
- [ ] Set page language

## Contributions

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
