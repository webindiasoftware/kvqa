import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///   TEXT STYLES
TextStyle getText100({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w100,
    letterSpacing: -0.2,
    height: heights,
  );
}

TextStyle getText200({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w200,
    letterSpacing: -0.2,
  );
}

TextStyle getText300({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w200,
    letterSpacing: -0.2,
  );
}

TextStyle getTextRegular({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.2,
    height: heights,
  );
}

TextStyle getTextRegularUnderline({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    decoration: TextDecoration.underline,
    decorationColor: colors,
    // decorationThickness: 1,
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.normal,
    height: heights,

    // letterSpacing: -0.2,
  );
}

TextStyle getText500({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
  letterSpacing = -0.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.2,
  );
}

TextStyle getText500UnderLine({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    decoration: TextDecoration.underline,
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.2,
    height: heights,
  );
}

TextStyle getText500lineThrough({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    decoration: TextDecoration.lineThrough,
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.2,
  );
}

TextStyle getText600({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w600,
    wordSpacing: -0.5,
    letterSpacing: -0.2,
    height: 1.2,
  );
}

TextStyle getText600UnderLine({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    decoration: TextDecoration.underline,
    fontSize: size,
    fontWeight: FontWeight.w600,
    wordSpacing: -0.5,
    letterSpacing: -0.2,
  );
}

TextStyle getTextBold({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.bold,
    wordSpacing: -0.5,
    letterSpacing: -0.2,
    height: heights,
  );
}

TextStyle getText800({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w800,
    wordSpacing: -0.5,
    letterSpacing: -0.2,
  );
}

TextStyle getText900({
  Color colors = Colors.black,
  size = 14.0,
  heights = 1.2,
}) {
  return GoogleFonts.poppins(
    color: colors,
    fontSize: size,
    fontWeight: FontWeight.w900,
    wordSpacing: -0.5,
    letterSpacing: -0.2,
  );
}

String formatName(String value) {
  if (value.isEmpty) return value;

  return value
      .replaceAll('-', ' ')
      .replaceAll('_', ' ')
      .split(' ')
      .map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      })
      .join(' ');
}


String toCapitalized(String value) {
  if (value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1).toLowerCase();
}

String formatAuto(double value) {
  if (value >= 10000000) {
    return "${(value / 10000000).toStringAsFixed(2)} Cr";
  } else if (value >= 100000) {
    return "${(value / 100000).toStringAsFixed(2)} L";
  } else if (value >= 1000) {
    return "${(value / 1000).toStringAsFixed(2)} Th";
  } else {
    return value.toString();
  }
}

Map<String, dynamic> parseToMap(String input) {
  final Map<String, dynamic> result = {};

  // Remove { }
  input = input.trim().substring(1, input.length - 1);

  // Split by comma
  final pairs = input.split(',');

  for (var pair in pairs) {
    final keyValue = pair.split(':');

    if (keyValue.length != 2) continue;

    final key = keyValue[0].trim();
    var value = keyValue[1].trim();

    // Convert Yes / No → bool
    if (value.toLowerCase() == 'yes') {
      result[key] = true;
    } else if (value.toLowerCase() == 'no') {
      result[key] = false;
    }
    // Convert number
    else if (int.tryParse(value) != null) {
      result[key] = int.parse(value);
    } else if (double.tryParse(value) != null) {
      result[key] = double.parse(value);
    }
    // Otherwise treat as String
    else {
      result[key] = value;
    }
  }

  return result;
}
