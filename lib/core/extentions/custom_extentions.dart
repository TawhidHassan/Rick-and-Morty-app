import 'dart:ui';

import '../config/Strings/api_endpoint.dart';



extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension EndPointExtensions on String {
  String addBaseURl() {
    return ApiEndpoint.baseUrl + this;
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension CardFormatter on String {
  String formatCardNumber() {
    String inputData = this;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }

    return buffer.toString();
  }

  String formatCardExpiration() {
    String inputData = this;
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != inputData.length) {
        buffer.write('/');
      }
    }
    return buffer.toString();
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
