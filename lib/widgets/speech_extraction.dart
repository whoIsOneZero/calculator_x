import 'dart:core';
import 'dart:core' as prefix0;

class SpeechExtraction {
  List<String?> extractNumbers(String sentence) {
    String pattern =
        "\\b(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve"
        "|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|thirty"
        "|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|million|billion|trillion)\\b";
    RegExp regExp = RegExp(pattern, caseSensitive: false);

    Iterable<Match> matches = regExp.allMatches(sentence);
    List<String?> numbers = matches.map((match) => match.group(0)).toList();

    return numbers;
  }

  List<double?> convertToDigits(List<String?> numbers) {
    /// Mapping word numbers to their corresponding digits
    Map<String, double> numberMap = {
      "one": 1,
      "two": 2,
      "three": 3,
      "four": 4,
      "five": 5,
      "six": 6,
      "seven": 7,
      "eight": 8,
      "nine": 9,
      "ten": 10,
      "eleven": 11,
      "twelve": 12,
      "thirteen": 13,
      "fourteen": 14,
      "fifteen": 15,
      "sixteen": 16,
      "seventeen": 17,
      "eighteen": 18,
      "nineteen": 19,
      "twenty": 20,
      "thirty": 30,
      "forty": 40,
      "fifty": 50,
      "sixty": 60,
      "seventy": 70,
      "eighty": 80,
      "ninety": 90,
      "hundred": 100,
      "thousand": 1000,
      "million": 1000000,
      "billion": 1000000000,
      "trillion": 1000000000000,
    };

    List<double?> digits =
        numbers.map((number) => numberMap[number?.toLowerCase()]).toList();

    return digits;
  }

  List<String?> extractOperations(String sentence) {
    String pattern = "\\b(?:plus|minus|multiplied by|divided by)\\b";
    RegExp regExp = RegExp(pattern, caseSensitive: false);

    Iterable<Match> matches = regExp.allMatches(sentence);
    List<String?> operations = matches.map((match) => match.group(0)).toList();

    return operations;
  }

  List<String?> convertToOperators(List<String?> operations) {
    /// Mapping word operations to their corresponding operators
    Map<String, String> operationMap = {
      "plus": "+",
      "minus": "-",
      "multiplied by": "*",
      "divided by": "/",
    };

    List<String?> operators = operations
        .map((operation) => operationMap[operation?.toLowerCase()])
        .toList();

    return operators;
  }
}
