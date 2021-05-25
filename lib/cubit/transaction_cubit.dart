import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/models.dart';
import 'package:food_market/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue result = await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message.toString()));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      return true;
    } else {
      return false;
    }
  }
}
