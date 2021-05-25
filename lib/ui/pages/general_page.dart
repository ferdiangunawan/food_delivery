part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function? onBackButtonPress;
  final Widget? child;
  final Color? backColor;
  final Widget? floatingButton;

  GeneralPage(
      {this.title = 'title',
      this.subtitle = 'subtitle',
      this.onBackButtonPress,
      this.child,
      this.backColor,
      this.floatingButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: floatingButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Container(
        color: backColor ?? Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      onBackButtonPress != null
                          ? GestureDetector(
                              onTap: () {
                                if (onBackButtonPress != null) {
                                  onBackButtonPress!();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 26),
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icon_back.png'))),
                              ),
                            )
                          : SizedBox(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                          Text(subtitle,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: greyColor)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: defaultMargin,
                  width: double.infinity,
                  color: Color(0xffFAFAFC),
                ),
                child ?? SizedBox()
              ],
            )
          ],
        ),
      )),
    );
  }
}
