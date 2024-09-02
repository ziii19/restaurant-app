import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/restaurant_detail.dart';
import '../../service/restaurant_exceptions.dart';
import '../../service/restaurant_service.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  final RestaurantRepository repository;

  RestaurantDetailBloc(this.repository) : super(RestaurantDetailInitial()) {
    on<FetchRestaurantDetail>((event, emit) async {
      emit(RestaurantDetailLoading());
      try {
        final restaurantDetail =
            await repository.fetchRestaurantDetail(event.id);
        emit(RestaurantDetailLoaded(restaurantDetail));
      } on NoInternetException {
        emit(RestaurantDetailError('No internet connection.'));
      } on RestaurantException catch (e) {
        emit(RestaurantDetailError(e.message));
      } catch (_) {
        emit(RestaurantDetailError('An unexpected error occurred.'));
      }
    });
  }
}
