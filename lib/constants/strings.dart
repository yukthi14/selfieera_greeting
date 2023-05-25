class Strings {
  static const String date = 'date';
  static const String specialDays = 'specialDay';
  static const String countryName = 'countryName';
  static const String title = 'Calender';
  static const String initialWork = 'initialWorks';
  static const String noData = 'No data available';
  static const String dialogTitle = 'Country';
  static const String loc = 'loc';
  static const String dayName = 'dayName';
  static const String celebration = "Let's Celebrate";
  static const String empty = '-------------------';
  String stringMonthManger(String month) {
    if (month == "January") {
      return "01";
    } else if (month == "February") {
      return "02";
    } else if (month == "March") {
      return "03";
    } else if (month == "April") {
      return "04";
    } else if (month == "May") {
      return "05";
    } else if (month == "June") {
      return "06";
    } else if (month == "July") {
      return "07";
    } else if (month == "August") {
      return "08";
    } else if (month == "September") {
      return "09";
    } else if (month == "October") {
      return "10";
    } else if (month == "November") {
      return "11";
    } else if (month == "December") {
      return "12";
    } else {
      return "Invalid";
    }
  }

  String stringDateManager(String date) {
    if (date == "1") {
      return "01";
    } else if (date == "2") {
      return "02";
    } else if (date == "3") {
      return "03";
    } else if (date == "4") {
      return "04";
    } else if (date == "5") {
      return "05";
    } else if (date == "6") {
      return "06";
    } else if (date == "7") {
      return "07";
    } else if (date == "8") {
      return "08";
    } else if (date == "9") {
      return "09";
    } else {
      return date;
    }
  }
}

var allEventDates = [];
List<Map<String, dynamic>> realData = [];
String location = '';
String dayName = '';
