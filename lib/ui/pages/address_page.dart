part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User? user;
  final String? password;
  final File? pictureFile;
  AddressPage(this.user, this.password, this.pictureFile);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late GeneralPage generalPage;
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  bool isLoading = false;
  String? selectedCity;
  List<String>? cities = ['Jakarta', 'Bandung', 'Surabaya'];
  @override
  void initState() {
    super.initState();
    selectedCity = cities![0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButtonPress: () {
        Get.back();
      },
      title: 'Address',
      subtitle: "Make sure it's valid",
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26),

            Text('Phone No.', style: blackFontStyle2),
            SizedBox(height: 6),
            //Note: Phone number
            TextField(
                cursorColor: Colors.black,
                controller: phoneController,
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
                    hintText: 'Type your phone number')),
            SizedBox(height: 16),
            //Note : Address
            Text(' \Address', style: blackFontStyle2),
            TextField(
                cursorColor: Colors.black,
                controller: addressController,
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
                    hintText: 'Type your address')),
            SizedBox(height: 16),
            Text('House No.', style: blackFontStyle2),
            SizedBox(height: 6),
            //Note : House Number
            TextField(
                cursorColor: Colors.black,
                controller: houseController,
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
                    hintText: 'Type your house number')),
            SizedBox(height: 16),
            Text('City', style: blackFontStyle2),
            SizedBox(height: 6),
            DropdownButtonFormField(
                value: selectedCity,
                hint: Text('Select your city', style: greyFontStyle),
                isDense: true,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8))),
                items: cities!
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedCity = item as String;
                  });
                }),

            SizedBox(height: 24),
            // Note : Button Sign Up Now
            Container(
                height: 45,
                width: double.infinity,
                child: (isLoading == true)
                    ? loadingIndicator
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            primary: mainColor),
                        onPressed: () async {
                          User user = widget.user!.copyWith(
                              phoneNumber: phoneController.text,
                              address: addressController.text,
                              houseNumber: houseController.text,
                              city: selectedCity);

                          setState(() {
                            isLoading = true;
                          });

                          await context.read<UserCubit>().signUp(
                              user, widget.password,
                              pictureFile: widget.pictureFile);

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
                        child: Text('Sign Up Now', style: blackFontStyle3))),
          ],
        ),
      ),
    );
  }
}
