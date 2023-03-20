class Date{

  Map<int, String> dayData = {
    1 : "Monday",
    2 : "Tuesday",
    3 : "Wednesday",
    4 : "Thursday",
    5 : "Friday",
    6 : "Saturday",
    7 : "Sunday",
  };

  Map<int, String> monthData = {
    1 : "January",
    2 : "February",
    3 : "March",
    4 : "April",
    5 : "May",
    6 : "June",
    7 : "July",
    8 : "August",
    9 : "September",
    10 : "October",
    11 : "November",
    12 : "December",
  };

  String getDay(DateTime date){
    return dayData[date.weekday].toString();
  }

  String getDate(DateTime date){
    return "${monthData[date.month]} ${date.day}, ${date.year}";
  }

}