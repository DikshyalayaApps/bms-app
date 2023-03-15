import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeListProvider =
    StateNotifierProvider<TimeListNotifier, AsyncValue<List<String>>>(
        (ref) => TimeListNotifier());

class TimeListNotifier extends StateNotifier<AsyncValue<List<String>>> {
  TimeListNotifier() : super(const AsyncValue.loading()) {
    _generateTimeList();
  }

  void _generateTimeList() async {
    try {
      final timeList = <String>[];
      for (var hour = 0; hour < 24; hour++) {
        for (var minute = 0; minute < 60; minute += 5) {
          if (hour == 0 && minute == 0) {
            timeList.add('12:00 AM');
          } else if (hour == 12 && minute == 0) {
            timeList.add('12:00 PM');
          } else if (hour < 12) {
            final hourString = (hour == 0 ? 12 : hour % 12).toString();
            timeList.add('$hourString:${minute.toString().padLeft(2, '0')} AM');
          } else if (hour == 12) {
            timeList.add('12:${minute.toString().padLeft(2, '0')} PM');
          } else {
            final hourString = (hour % 12).toString();
            timeList.add('$hourString:${minute.toString().padLeft(2, '0')} PM');
          }
          if (hour == 23 && minute == 55) {
            break; // stop generating times at 11:55 PM
          }
        }
      }
      state = AsyncValue.data(timeList);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
