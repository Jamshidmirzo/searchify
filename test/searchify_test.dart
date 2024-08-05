import 'package:searchify/searchify.dart';
import 'package:test/test.dart';

void main() {
  group('binarySearch tests', () {
    test('should find an integer in a list', () {
      final list = List.generate(100, (i) => i);
      final result = binarySearch(list, 50);
      expect(result['index'], 50);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should not find an integer in a list', () {
      final list = List.generate(100, (i) => i);
      final result = binarySearch(list, 150);
      expect(result['index'], -1);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should find a character in a string', () {
      final string = 'abcdefghijklmnopqrstuvwxyz';
      final result = binarySearch(string, 'm');
      expect(result['index'], 12);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should not find a character in a string', () {
      final string = 'abcdefghijklmnopqrstuvwxyz';
      final result = binarySearch(string, 'z');
      expect(result['index'], 25);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should throw an error for unsupported collection type', () {
      expect(() => binarySearch(123, 'a'), throwsA(isA<ArgumentError>()));
    });
  });

  group('linearSearch tests', () {
    test('should find an integer in a list', () {
      final list = List.generate(100, (i) => i);
      final result = linearSearch(list, 50);
      expect(result['index'], 50);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should not find an integer in a list', () {
      final list = List.generate(100, (i) => i);
      final result = linearSearch(list, 150);
      expect(result['index'], -1);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should find a character in a string', () {
      final string = 'abcdefghijklmnopqrstuvwxyz';
      final result = linearSearch(string, 'm');
      expect(result['index'], 12);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should not find a character in a string', () {
      final string = 'abcdefghijklmnopqrstuvwxyz';
      final result = linearSearch(string, 'z');
      expect(result['index'], 25);
      expect(result['time'], 0); // Ensure some time was spent
    });
  });

  group('jumpSearch tests', () {
    test('should find an integer in a list', () {
      final list = List.generate(100, (i) => i);
      final result = jumpSearch(list, 50);
      expect(result['index'], 50);
      expect(result['time'], 0); // Ensure some time was spent
    });
    test('should find a character in a string', () {
      final string = 'abcdefghijklmnopqrstuvwxyz';
      final result = jumpSearch(string, 'm');
      expect(result['index'], 12);
      expect(result['time'], 0); // Ensure some time was spent
    });

    test('should not find a character in a string', () {
      final string = 'abcdefghijklmnopqrstuvwxyz';
      final result = jumpSearch(string, 'z');
      expect(result['index'], 25);
      expect(result['time'], 0); // Ensure some time was spent
    });
  });
}
