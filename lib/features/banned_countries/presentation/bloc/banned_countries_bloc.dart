// ignore_for_file: collection_methods_unrelated_type

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/features/banned_countries/domain/usecases/add_banned_country_usecase.dart';
import 'package:sentinal/features/banned_countries/domain/usecases/delete_banned_country_usecase.dart';
import 'package:sentinal/features/banned_countries/domain/usecases/get_banned_countries_usecase.dart';

part 'banned_countries_event.dart';
part 'banned_countries_state.dart';

@injectable
class BannedCountriesBloc extends Bloc<BannedCountriesEvent, BannedCountriesState> {
  BannedCountriesBloc({
    required this.getBannedCountriesUsecase,
    required this.addCountryUsecase,
    required this.removeCountryUsecase,
  }) : super(const BannedCountriesInitial()) {
    on<LoadBannedCountries>(_handleLoadBannedCountries);
    on<AddCountry>(_handleAddCountry);
    on<RemoveCountry>(_handleRemoveCountry);
  }

  final GetBannedCountriesUsecase getBannedCountriesUsecase;
  final AddBannedCountryUseCase addCountryUsecase;
  final DeleteBannedCountryUseCase removeCountryUsecase;

  Future<void> _handleLoadBannedCountries(
    LoadBannedCountries event,
    Emitter<BannedCountriesState> emit,
  ) async {
    emit(const BannedCountriesLoading());

    final result = await getBannedCountriesUsecase.execute();

    result.fold(
      (failure) => emit(BannedCountriesError(message: failure.message)),
      (bannedCountries) => emit(
        BannedCountriesLoaded(
          bannedCountries: bannedCountries,
        ),
      ),
    );
  }

  Future<void> _handleAddCountry(
    AddCountry event,
    Emitter<BannedCountriesState> emit,
  ) async {
    emit(const BannedCountriesLoading());

    final currentState = state;
    if (currentState is BannedCountriesLoaded) {
      if (currentState.bannedCountries.contains(event.country)) {
        emit(BannedCountriesError(message: '${event.country} is already banned.'));
        return;
      }
    }

    final result = await addCountryUsecase.execute(event.country);

    result.fold(
      (failure) => emit(BannedCountriesError(message: failure.message)),
      (_) => emit(CountryAdded(country: event.country)),
    );

    add(const LoadBannedCountries());
  }

  Future<void> _handleRemoveCountry(
    RemoveCountry event,
    Emitter<BannedCountriesState> emit,
  ) async {
    emit(const BannedCountriesLoading());

    final result = await removeCountryUsecase.execute(event.country);

    result.fold(
      (failure) => emit(BannedCountriesError(message: failure.message)),
      (_) => emit(CountryRemoved(country: event.country)),
    );

    add(const LoadBannedCountries());
  }
}
