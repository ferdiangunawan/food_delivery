part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      title: "Yeay! Completed",
      subtitle: 'Now you are able to order\nsome foods as a self-reward',
      picturePath: 'assets/signup_wish.png',
      buttonTitle1: 'Find Foods',
      buttonTap1: () {},
      height: 289,
    );
  }
}
