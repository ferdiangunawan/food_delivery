part of 'list.dart';

class RecommendedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
      if (state is FoodLoaded) {
        List<Food> foods = state.food
            .where((element) => element.types!.contains(FoodType.recommended))
            .toList();
        return ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: foods
                  .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(
                            defaultMargin, 16, defaultMargin, 0),
                        child: FoodListItem(food: e),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 520,
            )
          ],
        );
      } else {
        return Center(child: loadingIndicator);
      }
    });
  }
}
