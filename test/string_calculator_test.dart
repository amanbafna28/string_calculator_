import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart'; // Adjust if your file is in a different folder

void main() {
  group('String Calculator', () {
    test('Phase 1: Empty and single number', () {
      expect(add(''), 0);
      expect(add('1'), 1);
    });

    test('Phase 2: Two numbers', () {
      expect(add('1,2'), 3);
    });

    test('Phase 3: Multiple numbers', () {
      expect(add('1,2,3'), 6);
    });

    test('Phase 4: Handles newlines', () {
      expect(add('1\n\n2,3'), 6);
    });

    test('Phase 6: Custom delimiter', () {
      expect(add('//;\n1;2'), 3);
    });

    test('Phase 6: Throws on negative numbers', () {
      expect(
            () => add('2,-4,3,-1'),
        throwsA(predicate((e) =>
        e is Exception &&
            e.toString().contains('negative numbers not allowed -4,-1'))),
      );
    });
  });
}
