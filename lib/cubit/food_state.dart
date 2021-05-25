part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoaded extends FoodState {
  final List<Food> food;
  FoodLoaded(this.food);
  @override
  List<Object> get props => [food];
}

class FoodLoadingFailed extends FoodState {
  final String? message;
  FoodLoadingFailed(this.message);
  @override
  List<Object> get props => [message!];
}
