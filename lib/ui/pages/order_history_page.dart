part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // if (inProgress.length == 0 && past.length == 0)
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return IlustrationPage(
              title: 'Ounch',
              subtitle: 'Seems like you have not\nordered any food yet',
              picturePath: 'assets/hungry.png',
              buttonTap1: () {
                Get.to(() => SignInPage());
              },
              buttonTitle1: 'Find Food');
        } else {
          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 100,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Orders', style: blackFontStyle),
                        Text('Wait for the best meal', style: greyFontStyle),
                      ],
                    ),
                  ),
                  //Body
                  Container(
                      margin: EdgeInsets.only(bottom: 16),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ['In Progress', 'Past Orders'],
                            selectedIndex: selectedPage,
                            onTap: (index) {
                              setState(() {
                                selectedPage = index;
                                pageController.jumpToPage(index);
                              });
                            },
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: PageView(
                              controller: pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              children: [InProgressList(), PastOrderList()],
                            ),
                          ),
                        ],
                      ))
                ],
              )
            ],
          );
        }
      } else {
        return loadingIndicator;
      }
    });
  }
}
