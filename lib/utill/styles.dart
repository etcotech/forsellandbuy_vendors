import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sixvalley_vendor_app/theme/controllers/theme_controller.dart';
import 'package:sixvalley_vendor_app/utill/dimensions.dart';

var titilliumRegular = TextStyle(
  fontFamily:  GoogleFonts.cairo().fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);


var titilliumSemiBold = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontSize: Dimensions.fontSizeLarge,
  fontWeight: FontWeight.w500,
);

var titilliumBold = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w600,
);
var titilliumItalic = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontSize: Dimensions.fontSizeDefault,
  fontStyle: FontStyle.italic,
);

var robotoHintRegular = TextStyle(
    fontFamily: GoogleFonts.cairo().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeSmall,
    color: Colors.grey
);
var robotoRegular = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
  color: Colors.black
);
var robotoRegularMainHeadingAddProduct = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
  color: Colors.black
);

var robotoRegularForAddProductHeading = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  color: Color(0xFF9D9D9D),
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
);

var robotoTitleRegular = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeLarge,
);

var robotoSmallTitleRegular = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
);

var robotoBold = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w600,
);

 var robotoMedium = TextStyle(
  fontFamily: GoogleFonts.cairo().fontFamily,
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w500,
);


class ThemeShadow {
  static List <BoxShadow> getShadow(BuildContext context) {
    List<BoxShadow> boxShadow =  [BoxShadow(color: Provider.of<ThemeController>(context, listen: false).darkTheme? Colors.black26:
    Theme.of(context).primaryColor.withValues(alpha:.075), blurRadius: 5,spreadRadius: 1,offset: const Offset(1,1))];
    return boxShadow;
  }
}
