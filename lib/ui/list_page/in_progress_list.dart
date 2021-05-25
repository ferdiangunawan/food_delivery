part of 'list.dart';

class InProgressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        List<Transaction> inProgress = state.transaction
            .where((element) =>
                element.status == TransactionStatus.on_delivery ||
                element.status == TransactionStatus.pending)
            .toList();
        return ListView(
          children: [
            Column(
                children: inProgress
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
