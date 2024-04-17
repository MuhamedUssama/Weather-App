// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/apis/api_manager.dart' as _i3;
import '../data/data_source_contract/weather_data_source_contract.dart' as _i4;
import '../data/data_source_impl/weather_data_source_impl.dart' as _i5;
import '../data/repository_impl/weather_repo_impl.dart' as _i7;
import '../repository_contract/weather_repo_contract.dart' as _i6;
import '../ui/screens/home/cubits/current_weather/current_weather_cubit.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.WeatherDataSourceContract>(
        () => _i5.WeatherDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.WeatherRepositoryContract>(
        () => _i7.WeatherRepositoryImpl(gh<_i4.WeatherDataSourceContract>()));
    gh.factory<_i8.CurrentWeatherViewModel>(
        () => _i8.CurrentWeatherViewModel(gh<_i6.WeatherRepositoryContract>()));
    return this;
  }
}
