import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/restaurant.dart';
import '../../service/restaurant_exception.dart';
import '../../service/restaurant_service.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository repository;

  RestaurantBloc(this.repository) : super(RestaurantInitial()) {
    on<FetchRestaurants>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurants = await repository.fetchRestaurants();
        emit(RestaurantLoaded(restaurants));
      } on NoInternetException {
        emit(const RestaurantError('No internet connection.'));
      } on DataNotFoundException {
        emit(const RestaurantError('No data found.'));
      } on RestaurantException catch (e) {
        emit(RestaurantError(e.message));
      } catch (_) {
        emit(const RestaurantError('An unexpected error occurred.'));
      }
    });

    on<SearchRestaurants>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurants = await repository.searchRestaurants(event.query);
        emit(RestaurantLoaded(restaurants));
      } on NoInternetException {
        emit(const RestaurantError('No internet connection.'));
      } on DataNotFoundException {
        emit(const RestaurantError('No data found.'));
      } on RestaurantException catch (e) {
        emit(RestaurantError(e.message));
      } catch (_) {
        emit(const RestaurantError('An unexpected error occurred.'));
      }
    });
  }
}
