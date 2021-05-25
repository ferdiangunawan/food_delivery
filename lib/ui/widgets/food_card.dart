part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food? food;
  final Function? onTap;
  FoodCard(this.food, this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: 200,
        height: 210,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(spreadRadius: 2, blurRadius: 15, color: Colors.black12)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(food!.picturePath!,
                  height: 140, width: 200, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Text(
                food!.name!,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: RatingStars(food!.rate!),
            ),
          ],
        ),
      ),
    );
  }
}
