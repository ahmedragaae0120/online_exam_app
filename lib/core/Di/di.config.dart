// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source_contract/signup_datasource.dart' as _i647;
import '../../data/data_source_impl/signup_datasource_impl.dart' as _i648;
import '../../data/repo_impl/signup_repo_impl.dart' as _i430;
import '../../domain/repo_contract/signup_repo_contract.dart' as _i229;
import '../../domain/use_cases/signup_usecase.dart' as _i459;
import '../../ui/Auth/Sign_Up/view_model/cubit/signup_cubit.dart' as _i537;
import '../api/api_manager.dart' as _i1047;

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
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i647.SignUpDataSourceContract>(
        () => _i648.SignUpDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i229.SignupRepoContract>(() => _i430.SignupRepoImpl(
        signUpDataSourceContract: gh<_i647.SignUpDataSourceContract>()));
    gh.factory<_i459.SignupUsecase>(() => _i459.SignupUsecase(
        signupRepoContract: gh<_i229.SignupRepoContract>()));
    gh.factory<_i537.SignupCubit>(
        () => _i537.SignupCubit(gh<_i459.SignupUsecase>()));
    return this;
  }
}
