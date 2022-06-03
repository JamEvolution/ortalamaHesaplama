import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static final TextStyle appBarStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static final TextStyle dropDownButtonTextStyle = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: anaRenk,
  );
  static final TextStyle errorTextStyle = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: anaRenk.shade300,
  );
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );
  static final TextStyle textFormFieldHintStyle = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: anaRenk,
  );
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static const dropDownPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
  static const MaterialColor anaRenk = Colors.purple;
  static const String appBarTitle = 'Ortalama Hesapla';
}
