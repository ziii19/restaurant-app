part of 'restaurant_detail_bloc.dart';

abstract class RestaurantDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RestaurantDetailInitial extends RestaurantDetailState {}

class RestaurantDetailLoading extends RestaurantDetailState {}

class RestaurantDetailLoaded extends RestaurantDetailState {
  final RestaurantDetail restaurantDetail;

  RestaurantDetailLoaded(this.restaurantDetail);

  @override
  List<Object?> get props => [restaurantDetail];
}

class RestaurantDetailError extends RestaurantDetailState {
  final String message;

  RestaurantDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
