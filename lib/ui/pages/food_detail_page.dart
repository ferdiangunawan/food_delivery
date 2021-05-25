part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function? onBackButtonPress;
  final Transaction? transaction;
  final Food? food;
  FoodDetailPage({this.onBackButtonPress, this.transaction, this.food});
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            //Food Image
            Image.network(widget.transaction!.food!.picturePath!,
                width: double.infinity, height: 330, fit: BoxFit.cover),
            //Body
            ListView(
              children: [
                Column(
                  children: [
                    //BottomSheet Container
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      margin: EdgeInsets.only(top: 250),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Food name
                                  Text(widget.transaction!.food!.name!,
                                      style: blackFontStyle2),
                                  SizedBox(height: 6),
                                  RatingStars(widget.transaction!.food!.rate!)
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                width: 87,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity = max(1, quantity - 1);
                                          });
                                        },
                                        child: Image.asset('assets/btn_min.png',
                                            height: 26,
                                            width: 26,
                                            fit: BoxFit.cover)),
                                    Text(quantity.toString(),
                                        style: blackFontStyle2),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity = min(999, quantity + 1);
                                          });
                                        },
                                        child: Image.asset('assets/btn_add.png',
                                            height: 26,
                                            width: 26,
                                            fit: BoxFit.cover)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12),
                          // Description
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width - (21 + 16),
                            child: Text(
                              widget.transaction!.food!.description!,
                              style: greyFontStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(height: 14),
                          //Ingredients
                          Text(
                            'Ingredients',
                            style: blackFontStyle3,
                          ),
                          SizedBox(height: 4),
                          Text(widget.transaction!.food!.ingredients!,
                              style: greyFontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total price :',
                                      style: greyFontStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(
                                              widget.transaction!.food!.price! *
                                                  quantity),
                                      style: blackFontStyle2.copyWith(
                                          fontSize: 18))
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                height: 45,
                                width: 163,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: mainColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(() => PaymentPage(
                                        transaction: widget.transaction!
                                            .copyWith(
                                                quantity: quantity,
                                                total: widget.transaction!.food!
                                                        .price! *
                                                    quantity)));
                                  },
                                  child:
                                      Text('Order Now', style: blackFontStyle3),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: defaultMargin),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black12),
                      child: Image.asset('assets/icon_back_white.png',
                          width: 24, height: 24, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container orderBottomSheet() {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          ListTile(title: Text('Makanan'), leading: Icon(Icons.face_outlined)),
          ListTile(title: Text('Makanan'), leading: Icon(Icons.face_outlined)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Get.back();
              },
              child: Text('Close Bottomsheet'))
        ],
      ),
    );
  }
}
