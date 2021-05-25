part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  // final Transaction? transaction;
  // ProfilePage({this.transaction});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: ListView(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                color: Color(0xffFAFAFC),
                child: Column(
                  children: [
                    Container(
                      height: 232,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 110,
                              width: 110,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/border.png'))),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage((context
                                                .read<UserCubit>()
                                                .state as UserLoaded)
                                            .user
                                            .picturePath!),
                                        fit: BoxFit.cover)),
                              )),
                          SizedBox(height: 16),
                          Text(
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .name
                                  .toString(),
                              style: blackFontStyle2),
                          SizedBox(height: 6),
                          Text(
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .email
                                  .toString(),
                              style: greyFontStyle)
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            selectedIndex: selectedPage,
                            titles: ['Account', 'FoodMarket'],
                            onTap: (index) {
                              setState(() {
                                selectedPage = index;
                                pageController.jumpToPage(index);
                              });
                            },
                          ),
                          SizedBox(
                            height: 208 - 34,
                            width: MediaQuery.of(context).size.width,
                            child: PageView(
                              controller: pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              children: [AccountList(), FoodMarketList()],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        )));
  }
}
