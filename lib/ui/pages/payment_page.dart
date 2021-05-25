part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction? transaction;
  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    int driverFee = 50000;
    double tax = 0.1;
    var taxOrder = widget.transaction!.total! * tax;
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      backColor: Color(0xffFAFAFC),
      onBackButtonPress: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item Ordered', style: blackFontStyle3),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          widget.transaction!.food!.picturePath!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (2 * defaultMargin + 60 + 12 + 58),
                          child: Text(widget.transaction!.food!.name!,
                              style: blackFontStyle2,
                              overflow: TextOverflow.clip,
                              maxLines: 1),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_ID',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format(widget.transaction!.food!.price!),
                          style: greyFontStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '${widget.transaction!.quantity!} item(s)',
                      style: greyFontStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                SizedBox(height: 8),
                //Note Detail Transaction
                Text('Details transaction', style: blackFontStyle3),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.transaction!.food!.name!,
                        style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(
                        NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: 'IDR ')
                            .format(widget.transaction!.food!.price),
                        style: blackFontStyle3)
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Driver', style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(
                        NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: 'IDR ')
                            .format(driverFee),
                        style: blackFontStyle3)
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax 10%',
                        style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(
                        NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: 'IDR ')
                            .format(widget.transaction!.total! * 0.1),
                        style: blackFontStyle3)
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(
                        NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: 'IDR ')
                            .format((widget.transaction!.total!) +
                                driverFee +
                                taxOrder),
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1ABC9C)))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deliver to', style: blackFontStyle3),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name', style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(widget.transaction!.user!.name!,
                        style: blackFontStyle3.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phone No. ',
                        style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(widget.transaction!.user!.phoneNumber!,
                        style: blackFontStyle3.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Address',
                        style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(widget.transaction!.user!.address!,
                        style: blackFontStyle3.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('House No. ',
                        style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(widget.transaction!.user!.houseNumber!,
                        style: blackFontStyle3.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('City ', style: greyFontStyle.copyWith(fontSize: 14)),
                    Text(widget.transaction!.user!.city!,
                        style: blackFontStyle3.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.bottomCenter,
            child: (isLoading)
                ? (loadingIndicator)
                : SizedBox(
                    width: 312,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          bool result = await context
                              .read<TransactionCubit>()
                              .submitTransaction(widget.transaction!.copyWith(
                                quantity: widget.transaction!.quantity,
                                dateTime: DateTime.now(),
                                total: widget.transaction!.total! +
                                    taxOrder.toInt() +
                                    driverFee,
                              ));
                          if (result == true) {
                            Get.to(() => SuccessOrderPage());
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            Get.snackbar('', '',
                                backgroundColor: Color(0xffD9435E),
                                icon: Icon(Icons.close_sharp),
                                titleText: Text('Transaction Failed',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                messageText: Text('Please try again letter',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)));
                          }
                        },
                        child: Text(
                          'Checkout Now',
                          style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500),
                        )),
                  ),
          ),
        ],
      ),
    );
  }
}
