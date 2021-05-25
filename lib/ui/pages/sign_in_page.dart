part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: 'Find your best ever meal',
      backColor: Color(0xffFAFAFC),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text('Email Address', style: blackFontStyle2),
            SizedBox(height: 6),
            //Note : Email Login
            TextField(
                cursorColor: Colors.black,
                controller: emailController,
                decoration: InputDecoration(
                    // isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: mainColor),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    hintText: 'Type your email address')),
            SizedBox(height: 16),
            Text('Password', style: blackFontStyle2),
            SizedBox(height: 6),
            //Note : Password
            TextField(
                cursorColor: Colors.black,
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    // isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: mainColor),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    hintText: 'Type your password')),
            SizedBox(height: 24),
            // Note : Button Sign In
            Container(
                height: 45,
                width: double.infinity,
                child: isLoading
                    ? loadingIndicator
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            primary: mainColor),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await context.read<UserCubit>().signIn(
                              emailController.text, passwordController.text);
                          UserState userState = context.read<UserCubit>().state;

                          if (userState is UserLoaded) {
                            context.read<FoodCubit>().getFoods();
                            context.read<TransactionCubit>().getTransactions();
                            Get.to(() => MainPage());
                          } else {
                            Get.snackbar('', '',
                                titleText: Text('Sign In Failed',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                messageText: Text(
                                    (userState as UserLoadingFailed)
                                        .message
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: Colors.white)),
                                icon: Icon(Icons.close_rounded,
                                    color: Colors.white),
                                backgroundColor: Color(0xffD9435E),
                                snackPosition: SnackPosition.TOP);

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Text('Sign In', style: blackFontStyle3))),
            SizedBox(height: 12),
            Container(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        primary: greyColor),
                    onPressed: () {
                      Get.to(() => SignUpPage());
                    },
                    child: Text('Create New Account',
                        style: blackFontStyle3.copyWith(color: Colors.white))))
          ],
        ),
      ),
    );
  }
}
