part of 'restaurant_detail_bloc.dart';

abstract class RestaurantDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRestaurantDetail extends RestaurantDetailEvent {
  final String id;

  FetchRestaurantDetail(this.id);

  @override
  List<Object?> get props => [id];
}
