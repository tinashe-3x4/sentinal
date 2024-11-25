part of 'banned_countries_bloc.dart';

sealed class BannedCountriesEvent extends Equatable {
  const BannedCountriesEvent();

  @override
  List<Object?> get props => [];
}

final class LoadBannedCountries extends BannedCountriesEvent {
  const LoadBannedCountries();
}

final class AddCountry extends BannedCountriesEvent {
  const AddCountry({required this.country});
  final List<String> country;

  @override
  List<Object?> get props => [country];
}

final class RemoveCountry extends BannedCountriesEvent {
  const RemoveCountry({required this.country});
  final String country;

  @override
  List<Object?> get props => [country];
}
