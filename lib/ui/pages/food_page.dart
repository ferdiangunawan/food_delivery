part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 108,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FoodMarket', style: blackFontStyle),
                        Text('Let’s get some foods', style: greyFontStyle),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .picturePath!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    )
                  ]),
            ),

            //List Food
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.food
                                .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: e == state.food.first
                                            ? defaultMargin
                                            : 0,
                                        right: e == state.food.last
                                            ? defaultMargin
                                            : 22),
                                    child: FoodCard(e, () {
                                      Get.to(() => FoodDetailPage(
                                            transaction: Transaction(
                                                food: e,
                                                user: (context
                                                        .read<UserCubit>()
                                                        .state as UserLoaded)
                                                    .user),
                                          ));
                                    })))
                                .toList(),
                          )
                        ],
                      )
                    : loadingIndicator,
              ),
            ),
            //TabView list of foods
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    selectedIndex: selectedPage,
                    titles: ['New Taste', 'Popular', 'Recommended'],
                    onTap: (index) {
                      setState(() {
                        selectedPage = index;
                        pageController.jumpToPage(selectedPage);
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          selectedPage = index;
                        });
                      },
                      children: [
                        NewTasteList(),
                        PopularList(),
                        RecommendedList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80)
          ],
        ),
      ],
    );
  }
}
