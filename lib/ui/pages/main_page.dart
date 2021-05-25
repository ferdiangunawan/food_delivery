part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int? initialIndex;
  MainPage({this.initialIndex = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialIndex!;
    pageController = PageController(initialPage: widget.initialIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
            child: Container(
              color: Color(0xffFAFAFC),
            ),
          ),
          PageView(
            // physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [FoodPage(), OrderHistoryPage(), ProfilePage()],
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
            pageController.jumpToPage(selectedPage);
          });
        },
      ),
    );
  }
}
