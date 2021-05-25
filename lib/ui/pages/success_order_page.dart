part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
        title: "You've Made Order",
        subtitle: 'Just stay at home while we are\npreparing your best foods',
        picturePath: 'assets/bike.png',
        buttonTitle1: 'Order Other Foods',
        buttonTap1: () {
          Get.offAll(() => MainPage());
        },
        buttonTap2: () {
          Get.offAll(() => MainPage(initialIndex: 1));
        },
        buttonTitle2: 'View My Order');
  }
}
