import 'package:searchify/searchify.dart';

void main() {
  // Example usage with a large list
  List<int> largeList =
      List.generate(1000000, (i) => i + 1); // List of 1 million integers
  Map<String, dynamic> resultList = binarySearch(largeList, 500000);
  print('List search result: $resultList');
}
