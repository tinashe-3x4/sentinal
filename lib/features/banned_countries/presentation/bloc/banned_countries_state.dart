part of 'banned_countries_bloc.dart';

sealed class BannedCountriesState extends Equatable {
  const BannedCountriesState();

  @override
  List<Object?> get props => [];
}

final class BannedCountriesInitial extends BannedCountriesState {
  const BannedCountriesInitial();
}

final class BannedCountriesLoading extends BannedCountriesState {
  const BannedCountriesLoading();
}

final class BannedCountriesLoaded extends BannedCountriesState {
  const BannedCountriesLoaded({required this.bannedCountries});
  final List<String> bannedCountries;

  @override
  List<Object?> get props => [bannedCountries];
}

final class CountryAdded extends BannedCountriesState {
  const CountryAdded({required this.country});
  final List<String> country;

  @override
  List<Object?> get props => [country];
}

final class CountryRemoved extends BannedCountriesState {
  const CountryRemoved({required this.country});
  final String country;

  @override
  List<Object?> get props => [country];
}

final class BannedCountriesError extends BannedCountriesState {
  const BannedCountriesError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
