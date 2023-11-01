import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension MainMarginLayout on Widget {
  Container addMainMarginLayout(Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }
}

extension SidebarTextPadding on Widget {
  Padding addPadding() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: this,
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle get inter => GoogleFonts.inter(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      );

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w700);

  TextStyle colored(Color color) => copyWith(color: color);
  TextStyle sized(double size) => copyWith(fontSize: size);
}
