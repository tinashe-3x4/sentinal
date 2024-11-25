// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sentinal/app/database/app_database.dart' as _i439;
import 'package:sentinal/app/injection/app_database_module.dart' as _i867;
import 'package:sentinal/features/banned_countries/data/data_sources/local/banned_countries_data_source.dart'
    as _i539;
import 'package:sentinal/features/banned_countries/data/data_sources/local/banned_countries_data_source_impl.dart'
    as _i331;
import 'package:sentinal/features/banned_countries/data/repositories/banned_countries_repository_impl.dart'
    as _i901;
import 'package:sentinal/features/banned_countries/domain/repositories/banned_countries_repository.dart'
    as _i893;
import 'package:sentinal/features/banned_countries/domain/usecases/add_banned_country_usecase.dart'
    as _i18;
import 'package:sentinal/features/banned_countries/domain/usecases/delete_banned_country_usecase.dart'
    as _i641;
import 'package:sentinal/features/banned_countries/domain/usecases/get_banned_countries_usecase.dart'
    as _i965;
import 'package:sentinal/features/banned_countries/presentation/bloc/banned_countries_bloc.dart'
    as _i1053;
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source.dart'
    as _i350;
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source_impl.dart'
    as _i153;
import 'package:sentinal/features/cards/data/repositories/cards_repository_impl.dart'
    as _i304;
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart'
    as _i371;
import 'package:sentinal/features/cards/domain/usecases/add_card_usecase.dart'
    as _i505;
import 'package:sentinal/features/cards/domain/usecases/delete_card_usecase.dart'
    as _i1036;
import 'package:sentinal/features/cards/domain/usecases/get_cards_usecase.dart'
    as _i132;
import 'package:sentinal/features/cards/presentation/bloc/bloc/cards_bloc.dart'
    as _i648;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    gh.lazySingleton<_i439.AppDatabase>(() => databaseModule.appDatabase);
    gh.lazySingleton<_i350.LocalCardDataSource>(
        () => _i153.LocalCardDataSourceImpl(gh<_i439.AppDatabase>()));
    gh.lazySingleton<_i371.CardsRepository>(() => _i304.CardsRepositoryImpl(
        localCardDataSource: gh<_i350.LocalCardDataSource>()));
    gh.lazySingleton<_i132.GetCardsUsecase>(
        () => _i132.GetCardsUsecase(gh<_i371.CardsRepository>()));
    gh.lazySingleton<_i1036.DeleteCardUseCase>(
        () => _i1036.DeleteCardUseCase(gh<_i371.CardsRepository>()));
    gh.lazySingleton<_i505.AddCardUseCase>(
        () => _i505.AddCardUseCase(gh<_i371.CardsRepository>()));
    gh.lazySingleton<_i539.BannedCountriesDataSource>(
        () => _i331.BannedCountriesDataSourceImpl(gh<_i439.AppDatabase>()));
    gh.factory<_i648.CardsBloc>(() => _i648.CardsBloc(
          getCardsUsecase: gh<_i132.GetCardsUsecase>(),
          addCardUseCase: gh<_i505.AddCardUseCase>(),
          deleteCardUseCase: gh<_i1036.DeleteCardUseCase>(),
        ));
    gh.lazySingleton<_i893.BannedCountriesRepository>(() =>
        _i901.BannedCountriesRepositoryImpl(
            dataSource: gh<_i539.BannedCountriesDataSource>()));
    gh.lazySingleton<_i18.AddBannedCountryUseCase>(() =>
        _i18.AddBannedCountryUseCase(gh<_i893.BannedCountriesRepository>()));
    gh.lazySingleton<_i965.GetBannedCountriesUsecase>(() =>
        _i965.GetBannedCountriesUsecase(gh<_i893.BannedCountriesRepository>()));
    gh.lazySingleton<_i641.DeleteBannedCountryUseCase>(() =>
        _i641.DeleteBannedCountryUseCase(
            gh<_i893.BannedCountriesRepository>()));
    gh.factory<_i1053.BannedCountriesBloc>(() => _i1053.BannedCountriesBloc(
          getBannedCountriesUsecase: gh<_i965.GetBannedCountriesUsecase>(),
          addCountryUsecase: gh<_i18.AddBannedCountryUseCase>(),
          removeCountryUsecase: gh<_i641.DeleteBannedCountryUseCase>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i867.DatabaseModule {}
