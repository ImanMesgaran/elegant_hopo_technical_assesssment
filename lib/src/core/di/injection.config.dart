// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:technical_challenge/src/core/network/network_client.dart'
    as _i490;
import 'package:technical_challenge/src/features/home/data/datasources/home_remote_datasource.dart'
    as _i64;
import 'package:technical_challenge/src/features/home/data/repositories/home_repository_impl.dart'
    as _i892;
import 'package:technical_challenge/src/features/home/domain/repositories/home_repository.dart'
    as _i25;
import 'package:technical_challenge/src/features/home/domain/usecases/get_home_items.dart'
    as _i744;
import 'package:technical_challenge/src/features/home/presentation/bloc/home_bloc.dart'
    as _i208;
import 'package:technical_challenge/src/features/home/presentation/pages/home_page.dart'
    as _i982;

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
    gh.factory<_i982.HomePage>(() => _i982.HomePage(key: gh<_i409.Key>()));
    gh.factory<_i208.HomeBloc>(() => _i208.HomeBloc(gh<_i744.GetHomeItems>()));
    gh.factory<_i64.HomeRemoteDataSource>(
        () => _i64.HomeRemoteDataSource(gh<_i490.NetworkClient>()));
    gh.factory<_i25.HomeRepository>(() => _i892.HomeRepositoryImpl(
          gh<_i64.HomeRemoteDataSource>(),
          gh<_i490.NetworkClient>(),
        ));
    return this;
  }
}
