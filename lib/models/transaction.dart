part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, cancelled }

class Transaction extends Equatable {
  final int? id;
  final Food? food;
  final int? quantity;
  final int? total;
  final DateTime? dateTime;
  final TransactionStatus? status;
  final User? user;
  final String? paymentUrl;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user,
      this.paymentUrl});

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
      id: data['id'],
      food: Food.fromJson(data['food']),
      quantity: data['quantity'],
      total: data['total'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      status: (data['status'] == 'PENDING')
          ? TransactionStatus.pending
          : (data['status'] == 'DELIVERED')
              ? TransactionStatus.delivered
              : (data['status'] == 'CANCELLED')
                  ? TransactionStatus.cancelled
                  : TransactionStatus.on_delivery,
      paymentUrl: data['payment_url']);

  Transaction copyWith(
      {int? id,
      Food? food,
      int? quantity,
      int? total,
      DateTime? dateTime,
      TransactionStatus? status,
      User? user}) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  List<Object> get props => [id!, food!, quantity!, total!, dateTime!, status!, user!];
}
List<Transaction> dummyTransactions = [
  Transaction(
      id: 1,
      food: dummyFoods[5],
      quantity: 2,
      total: (dummyFoods[5].price! * 2 * 1.1).round() + 10000,
      dateTime: DateTime.now(),
      status: TransactionStatus.delivered,
      user: dummyUsers),
  Transaction(
      id: 2,
      food: dummyFoods[4],
      quantity: 3,
      total: (dummyFoods[3].price! * 2 * 1.1).round() + 60000,
      dateTime: DateTime.now(),
      status: TransactionStatus.cancelled,
      user: dummyUsers),
  Transaction(
      id: 3,
      food: dummyFoods[6],
      quantity: 4,
      total: (dummyFoods[6].price! * 4 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivery,
      user: dummyUsers),
  Transaction(
      id: 4,
      food: dummyFoods[3],
      quantity: 4,
      total: (dummyFoods[3].price! * 4 * 1.1).round() + 35000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivery,
      user: dummyUsers),
  Transaction(
      id: 5,
      food: dummyFoods[4],
      quantity: 4,
      total: (dummyFoods[4].price! * 4 * 1.1).round() + 55000,
      dateTime: DateTime.now(),
      status: TransactionStatus.pending,
      user: dummyUsers),
];
