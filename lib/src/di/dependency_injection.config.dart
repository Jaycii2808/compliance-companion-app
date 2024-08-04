// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../presentation/screen/home_screen/bloc/home_bloc.dart' as _i1022;
import '../presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart'
    as _i269;

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
    gh.factory<_i269.TaskListScreenBloc>(() => _i269.TaskListScreenBloc());
    gh.factory<_i1022.HomeBloc>(() => _i1022.HomeBloc());
    return this;
  }
}
