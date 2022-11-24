import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(180, 26, 69, 121);
const Color secondaryColor = Color.fromARGB(180, 53, 125, 212);

const Decoration titleBox = BoxDecoration(color: secondaryColor);

final TextStyle titleStyle =
    GoogleFonts.comfortaa(fontWeight: FontWeight.w600, fontSize: 50);

final TextStyle headerStyle = GoogleFonts.montserrat(
    color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20);

final TextStyle subTitleStyle = GoogleFonts.comfortaa(
    fontWeight: FontWeight.w600, fontSize: 30, color: primaryColor);

final TextStyle captionStyle =
    GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 20);

final TextStyle paragraphStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 20, height: 2);

final TextStyle actionStyle = GoogleFonts.comfortaa(
    fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white);

final TextStyle smallActionStyle =
    GoogleFonts.comfortaa(fontWeight: FontWeight.w600, fontSize: 20);

const ButtonStyle actionButtonStyle =
    ButtonStyle(backgroundColor: MaterialStatePropertyAll(actionColor));

const ButtonStyle headerButtonStyle = ButtonStyle(
    shadowColor: MaterialStatePropertyAll(Colors.transparent),
    backgroundColor: MaterialStatePropertyAll(Colors.transparent));

const Color actionColor = Color(0xfff8941c);
