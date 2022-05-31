class UtilsDatetime {
  static DateTime stringToDate(String date) {
    final DateTime data = DateTime.tryParse(date)!;
    return data.toLocal();
  }

  static String stringToEpochTimeStamp(String date) {
    final DateTime? data = DateTime.parse(date);
    final String epochDate = data!.toIso8601String();
    return epochDate;
  }
}
