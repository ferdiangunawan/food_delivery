part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;
  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap!(0);
            },
            child: Image.asset(
              (selectedIndex == 0)
                  ? 'assets/ic_home.png'
                  : 'assets/ic_home_normal.png',
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap!(1);
            },
            child: Image.asset(
              (selectedIndex == 1)
                  ? 'assets/ic_order.png'
                  : 'assets/ic_order_normal.png',
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap!(2);
            },
            child: Image.asset(
              (selectedIndex == 2)
                  ? 'assets/ic_profile.png'
                  : 'assets/ic_profile_normal.png',
              width: 32,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
