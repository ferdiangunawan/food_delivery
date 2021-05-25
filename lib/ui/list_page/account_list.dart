part of 'list.dart';

class AccountList extends StatelessWidget {
  final List<String> accountlistmenu = [
    'Edit profile',
    'Home address',
    'Security',
    'Payment'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: accountlistmenu
          .map((e) => GestureDetector(
                onTap: () {
                  Get.to(() => accountlistmenu.indexOf(e) == 0
                      ? EditProfilePage()
                      : accountlistmenu.indexOf(e) == 1
                          ? MainPage()
                          : SignInPage());
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Text(e, style: blackFontStyle3),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            color: Color(0xff8D92A3), size: 24)
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
