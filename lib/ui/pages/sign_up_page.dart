part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool? isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButtonPress: () {
        Get.back();
      },
      title: 'Sign Up',
      subtitle: 'Register and eat',
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async {
                  PickedFile? pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    pictureFile = File(pickedFile.path);
                    setState(() {});
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/border.png'))),
                  child: (pictureFile != null)
                      ? Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(pictureFile!),
                                  fit: BoxFit.cover)))
                      : Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/photo.png'),
                                  fit: BoxFit.cover))),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Full Name', style: blackFontStyle2),
            SizedBox(height: 6),
            //Note: Full Name
            TextField(
                cursorColor: Colors.black,
                controller: nameController,
                decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: mainColor),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    hintText: 'Type your full name')),
            SizedBox(height: 16),
            //Note : Email Login
            Text('Email Address', style: blackFontStyle2),
            TextField(
                cursorColor: Colors.black,
                controller: emailController,
                decoration: InputDecoration(
                    isDense: true,
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
                    isDense: true,
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
            // Note : Button Sign Up
            Container(
                height: 45,
                width: double.infinity,
                child: isLoading == true
                    ? loadingIndicator
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            primary: mainColor),
                        onPressed: () {
                          Get.to(() => AddressPage(
                              User(
                                  name: nameController.text,
                                  email: emailController.text),
                              passwordController.text,
                              pictureFile));
                        },
                        child: Text('Continue', style: blackFontStyle3))),
          ],
        ),
      ),
    );
  }
}
