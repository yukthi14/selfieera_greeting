class SpecialDays {
  String dayName;
  String date;
  String time;
  String countryName;

  SpecialDays({
    required this.dayName,
    required this.countryName,
    required this.date,
    required this.time,
  });

  factory SpecialDays.fromJson(Map<dynamic, dynamic> json) => SpecialDays(
        dayName: json['SPECIAL DAY'],
        countryName: json['COUNTRY NAME'],
        date: json['DATE'],
        time: json['TIME'],
      );
}
