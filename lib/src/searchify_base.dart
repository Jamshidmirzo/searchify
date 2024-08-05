// binary_search.dart

Map<String, dynamic> binarySearch(dynamic collection, dynamic key) {
  final stopwatch = Stopwatch()..start(); // Start the stopwatch to measure time
  int index;

  if (collection is List) {
    // Check if the collection is a List and the key is Comparable
    if (key is Comparable) {
      index = _binarySearchList(collection as List<Comparable>, key);
    } else {
      throw ArgumentError('Key must be Comparable for list search');
    }
  } else if (collection is String && key is String) {
    // Check if the collection is a String and the key is a String
    index = _binarySearchString(collection, key);
  } else {
    throw ArgumentError('Unsupported collection or key type');
  }

  stopwatch.stop(); // Stop the stopwatch after the search is complete

  // Return the index and time taken in milliseconds (as double for precision)
  return {
    'index': index,
    'time': stopwatch.elapsed.inMilliseconds.toDouble(),
  };
}

int _binarySearchList<T extends Comparable>(List<T> list, T key) {
  int left = 0;
  int right = list.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    int comparison = list[mid].compareTo(key);
    if (comparison == 0) {
      return mid; // Item found
    } else if (comparison < 0) {
      left = mid + 1; // Search right half
    } else {
      right = mid - 1; // Search left half
    }
  }

  return -1; // Item not found
}

int _binarySearchString(String string, String key) {
  int left = 0;
  int right = string.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    if (string[mid] == key) {
      return mid; // Character found
    } else if (string[mid].compareTo(key) < 0) {
      left = mid + 1; // Search right half
    } else {
      right = mid - 1; // Search left half
    }
  }

  return -1; // Character not found
}
// linear_search.dart

Map<String, dynamic> linearSearch(dynamic collection, dynamic key) {
  final stopwatch = Stopwatch()..start(); // Start the stopwatch to measure time
  int index = -1;

  if (collection is List) {
    if (key is Comparable) {
      index = _linearSearchList(collection as List<Comparable>, key);
    } else {
      stopwatch.stop(); // Stop the stopwatch before throwing an error
      throw ArgumentError('Key must be Comparable for list search');
    }
  } else if (collection is String && key is String) {
    index = _linearSearchString(collection, key);
  } else {
    stopwatch.stop(); // Stop the stopwatch before throwing an error
    throw ArgumentError('Unsupported collection or key type');
  }

  stopwatch.stop(); // Stop the stopwatch after the search is complete

  // Return the index and time taken in milliseconds (as double for precision)
  return {
    'index': index,
    'time': stopwatch.elapsed.inMilliseconds.toDouble(),
  };
}

int _linearSearchList<T extends Comparable>(List<T> list, T key) {
  for (int i = 0; i < list.length; i++) {
    if (list[i].compareTo(key) == 0) {
      return i; // Item found
    }
  }
  return -1; // Item not found
}

int _linearSearchString(String string, String key) {
  for (int i = 0; i < string.length; i++) {
    if (string[i] == key) {
      return i; // Character found
    }
  }
  return -1; // Character not found
}

// jump_search.dart
// Function to perform jump search
Map<String, dynamic> jumpSearch(dynamic collection, dynamic key) {
  final stopwatch = Stopwatch()..start(); // Start the stopwatch to measure time
  int index = -1;
  const int stepSize = 5; // Define the step size for jump search

  if (collection is List) {
    if (key is Comparable) {
      index = _jumpSearchList(collection as List<Comparable>, key, stepSize);
    } else {
      stopwatch.stop(); // Stop the stopwatch before throwing an error
      throw ArgumentError('Key must be Comparable for list search');
    }
  } else if (collection is String && key is String) {
    index = _jumpSearchString(collection, key, stepSize);
  } else {
    stopwatch.stop(); // Stop the stopwatch before throwing an error
    throw ArgumentError('Unsupported collection or key type');
  }

  stopwatch.stop(); // Stop the stopwatch after the search is complete

  // Return the index and time taken in milliseconds (as double for precision)
  return {
    'index': index,
    'time': stopwatch.elapsed.inMilliseconds.toDouble(),
  };
}

// Helper method for jump search in a list
int _jumpSearchList<T extends Comparable>(List<T> list, T key, int stepSize) {
  int n = list.length;
  int step = stepSize;
  int prev = 0;

  // Jump forward by step size
  while (step < n && list[step].compareTo(key) < 0) {
    prev = step;
    step += stepSize;
    if (step >= n) step = n - 1; // Bound check
  }

  // Linear search within the block
  for (int i = prev; i <= step; i++) {
    if (list[i].compareTo(key) == 0) {
      return i; // Item found
    }
  }

  return -1; // Item not found
}

// Helper method for jump search in a string
int _jumpSearchString(String string, String key, int stepSize) {
  int n = string.length;
  int step = stepSize;
  int prev = 0;

  // Jump forward by step size
  while (step < n && string[step].compareTo(key) < 0) {
    prev = step;
    step += stepSize;
    if (step >= n) step = n - 1; // Bound check
  }

  // Linear search within the block
  for (int i = prev; i <= step; i++) {
    if (string[i] == key) {
      return i; // Character found
    }
  }

  return -1; // Character not found
}
