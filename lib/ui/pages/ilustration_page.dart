part of 'pages.dart';

class IlustrationPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? picturePath;
  final String? buttonTitle1;
  final String? buttonTitle2;
  final Function? buttonTap1;
  final Function? buttonTap2;
  final double? height;
  IlustrationPage(
      {@required this.title,
      @required this.subtitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.buttonTap1,
      this.buttonTap2,
      this.height = 220});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(picturePath!,
                width: 200, height: height, fit: BoxFit.contain),
            SizedBox(height: 30),
            Text(title!,
                style: blackFontStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(height: 6),
            Text(
              subtitle!,
              style: greyFontStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      buttonTap1!();
                    },
                    child: Text(buttonTitle1!,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500)))),
            SizedBox(height: 12),
            (buttonTap2 != null)
                ? SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff8D92A3),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          buttonTap2!();
                        },
                        child: Text(buttonTitle2 ?? 'title',
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))))
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
