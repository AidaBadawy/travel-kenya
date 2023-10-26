import 'package:flutter_test/flutter_test.dart';
import 'package:travel_kenya/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MessageViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}