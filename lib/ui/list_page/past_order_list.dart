part of 'list.dart';

class PastOrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        List<Transaction> pastOrder = state.transaction
            .where((element) =>
                element.status == TransactionStatus.delivered ||
                element.status == TransactionStatus.cancelled)
            .toList();
        return ListView(
          children: [
            Column(
                children: pastOrder
                    .map((e) => Padding(
                          padding: const EdgeInsets.fromLTRB(
                              defaultMargin, 16, defaultMargin, 0),
                          child: HistoryOrderList(transaction: e),
                        ))
                    .toList()),
          ],
        );
      } else {
        return Center(child: loadingIndicator);
      }
    });
  }
}
