part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food? food;
  FoodListItem({@required this.food});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(food!.picturePath!,
              width: 60, height: 60, fit: BoxFit.cover),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(food!.name!, style: blackFontStyle2),
            Text(
                NumberFormat.currency(
                        symbol: 'IDR ', locale: 'id_ID', decimalDigits: 0)
                    .format(food!.price),
                style: greyFontStyle.copyWith(fontSize: 13)),
          ],
        ),
        Spacer(),
        RatingStars(food!.rate!)
      ],
    );
  }
}
