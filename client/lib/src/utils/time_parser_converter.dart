class TimeParserConverter {
  TimeParserConverter(this.nrSeconds);
  TimeParserConverter.fromString(String? durationString)
      : nrSeconds = parse(durationString);

  num? nrSeconds;
  static String? validationError;

  @override
  String toString() {
    if (nrSeconds == null) {
      return "";
    }

    Duration duration = Duration(seconds: nrSeconds!.toInt());

    String formattedString = "";
    if (duration.inHours > 0) {
      formattedString += "${duration.inHours}:";
    }
    formattedString += "${duration.inMinutes.remainder(60)}:";
    formattedString +=
        duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    return formattedString;
  }

  static num? parse(String? value) {
    // Reset validationError
    validationError = null;

    if (value == null || value.isEmpty) {
      validationError = "Must contain a value";
      return null;
    }

    List<String> input = value.split(":");
    if (input.length > 3) {
      validationError = "Only hours, minutes, and seconds";
      return null;
    }

    List<int?> maybeNumbers = input
        .map((e) => int.tryParse(e))
        .map((e) => e != null && e < 0 ? null : e)
        .toList();

    if (maybeNumbers.any((element) => element == null)) {
      validationError = "Please only use numeric characters and :";
      return null;
    }

    List<int> numbers = maybeNumbers.map((e) => e!).toList().reversed.toList();

    int hours = numbers.length > 2 ? numbers[2] : 0;
    int minutes = numbers.length > 1 ? numbers[1] : 0;
    int seconds = numbers[0];
    if (seconds > 59) {
      validationError = "Seconds is wrong";
      return null;
    }
    if (minutes > 59) {
      validationError = "Minutes is wrong";
      return null;
    }

    // Set the value
    num toSeconds =
        Duration(hours: hours, minutes: minutes, seconds: seconds).inSeconds;
    if (toSeconds == 0) {
      validationError = "Duration must be non zero";
      return null;
    }

    return toSeconds;
  }
}
