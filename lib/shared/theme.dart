part of 'shared.dart';

const double defaultMargin = 24;
Color mainColor = Color(0xffFFC700);
Color greyColor = Color(0xff8D92A3);
Widget loadingIndicator = SpinKitFadingCircle(size: 50, color: mainColor);

TextStyle greyFontStyle = GoogleFonts.poppins(color: greyColor);
TextStyle blackFontStyle = GoogleFonts.poppins(
    color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);
TextStyle blackFontStyle3 = GoogleFonts.poppins(
    fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400);
