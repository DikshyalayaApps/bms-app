
extension ListFromMap<Key, Element> on Map<Key, Element> {
  List<T> toList<T>(T Function(MapEntry<Key, Element> entry) getElement) =>
      entries.map(getElement).toList();
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension StringExtension on String {
  String get capitalize =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : this;
}

extension ToDoubleExtension on Object {
  //dynamic
  double toSafeDouble() {
    if (this is double) {
      return this as double;
    } else if (this is int) {
      return (this as int).toDouble();
    } else if (this is String) {
      final parsed = double.tryParse(this as String);
      if (parsed != null) {
        return parsed;
      }
    }
    return 0.0;
  }
}

extension ListUtils<T> on List<T> {
  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (final item in this) {
      sum += f(item);
    }
    return sum;
  }
}
