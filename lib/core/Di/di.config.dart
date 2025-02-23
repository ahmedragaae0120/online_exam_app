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
import 'package:online_exam_app/data/data_source_impl/ForgetPassword/ForgetPassWord.dart';
import 'package:online_exam_app/data/data_source_impl/ForgetPassword/ResetpasswordDataSourceRepoImpl.dart';
import 'package:online_exam_app/data/data_source_impl/ForgetPassword/VerifyresetcodeRepoDataSourceImpl.dart';
import 'package:online_exam_app/data/data_source_impl/signin_datasource_impl.dart';
import 'package:online_exam_app/data/data_source_impl/signup_datasource_impl.dart';
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/data_source_contract/ForgetPassword_dataSourses/ForgetPassword_dataSourse.dart'
    as _i42;
import '../../data/data_source_contract/ForgetPassword_dataSourses/ResetpasswordDataSourceRepo.dart'
    as _i865;
import '../../data/data_source_contract/ForgetPassword_dataSourses/VerifyresetcodeRepoDataSource.dart'
    as _i443;
import '../../data/data_source_contract/get_profile_datasource.dart' as _i705;
import '../../data/data_source_contract/signin_datasource.dart' as _i1072;
import '../../data/data_source_contract/signup_datasource.dart' as _i647;
import '../../data/data_source_contract/update_profile_datasource.dart'
    as _i389;
import '../../data/data_source_impl/get_profile_datasource_impl.dart' as _i290;
import '../../data/data_source_impl/update_profile_datasource_impl.dart'
    as _i943;
import '../../data/repo_impl/Forget%20Password%20Impl/ForgetPasswordRepoImpl.dart'
    as _i455;
import '../../data/repo_impl/Forget%20Password%20Impl/ResetpasswordRepoImpl.dart'
    as _i343;
import '../../data/repo_impl/Forget%20Password%20Impl/VerifyresetcodeRepoImpl.dart'
    as _i165;
import '../../data/repo_impl/get_profile_repo_impl.dart' as _i676;
import '../../data/repo_impl/signin_repo_impl.dart' as _i209;
import '../../data/repo_impl/signup_repo_impl.dart' as _i430;
import '../../data/repo_impl/update_profile_repo_impl.dart' as _i383;
import '../../domain/repo_contract/Forget%20Password%20Repos/ForgetPassword_repo.dart'
    as _i105;
import '../../domain/repo_contract/Forget%20Password%20Repos/resetPasswordRepo.dart'
    as _i974;
import '../../domain/repo_contract/Forget%20Password%20Repos/verifyResetCodeRepo.dart'
    as _i460;
import '../../domain/repo_contract/get_profile_repo_contract.dart' as _i726;
import '../../domain/repo_contract/sign_in_repo_contract.dart' as _i1006;
import '../../domain/repo_contract/signup_repo_contract.dart' as _i229;
import '../../domain/repo_contract/update_profile_repo_contract.dart' as _i176;
import '../../domain/use_cases/Forget%20Password%20Use%20Cases/ForgetPassword_Use_Case.dart'
    as _i524;
import '../../domain/use_cases/Forget%20Password%20Use%20Cases/resetPassword_UseCase.dart'
    as _i498;
import '../../domain/use_cases/Forget%20Password%20Use%20Cases/verifyResetCodeUseCase.dart'
    as _i644;
import '../../domain/use_cases/get_profile_usecase.dart.dart' as _i610;
import '../../domain/use_cases/signin_usecase.dart' as _i788;
import '../../domain/use_cases/signup_usecase.dart' as _i459;
import '../../domain/use_cases/update_profile_usecase.dart' as _i754;
import '../../ui/Auth/view_model/cubit/auth_cubit.dart' as _i906;
import '../../ui/Profile_Details/viewmodel/cubit/profile_cubit.dart' as _i159;
import '../api/api_manager.dart' as _i1047;
import '../services/token_storage_service.dart' as _i474;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i474.TokenStorageService>(
        () => _i474.TokenStorageService(gh<_i460.SharedPreferences>()));
    gh.singleton<_i1047.ApiManager>(
        () => _i1047.ApiManager(gh<_i474.TokenStorageService>()));
    gh.factory<_i389.UpdateProfileDataSourceContract>(
        () => _i943.UpdateProfileDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i705.ProfileDataSourceContract>(
        () => _i290.ProfileDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i42.ForgetpasswordDataSourseRepo>(() =>
        ForgetpasswordDataSourceRepoImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i1072.SignInDataSourceContract>(
        () => SigninDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i647.SignUpDataSourceContract>(
        () => SignUpDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i443.VerifyresetcodeRepoDataSource>(() =>
        Verifyresetcoderepodatasourceimpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i865.ResetpasswordDataSourceRepo>(() =>
        Resetpassworddatasourcerepoimpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i974.ResetpasswordRepo>(() =>
        _i343.Resetpasswordrepoimpl(gh<_i865.ResetpasswordDataSourceRepo>()));
    gh.factory<_i726.ProfileRepoContract>(
        () => _i676.ProfileRepoImpl(gh<_i705.ProfileDataSourceContract>()));
    gh.factory<_i610.GetProfileUseCase>(
        () => _i610.GetProfileUseCase(gh<_i726.ProfileRepoContract>()));
    gh.factory<_i105.ForgetpasswordRepo>(() => _i455.Forgetpasswordrepoimpl(
        forgetpassword_data_sourse_repo:
            gh<_i42.ForgetpasswordDataSourseRepo>()));
    gh.factory<_i176.UpdateProfileRepoContract>(() =>
        _i383.UpdateProfileRepoImpl(
            updateProfileDataSourceContract:
                gh<_i389.UpdateProfileDataSourceContract>()));
    gh.factory<_i1006.SignInRepoContract>(
        () => _i209.SigninRepoImpl(gh<_i1072.SignInDataSourceContract>()));
    gh.factory<_i754.UpdateProfileUseCase>(() =>
        _i754.UpdateProfileUseCase(gh<_i176.UpdateProfileRepoContract>()));
    gh.factory<_i159.ProfileCubit>(() => _i159.ProfileCubit(
          getProfileUseCase: gh<_i610.GetProfileUseCase>(),
          updateProfileUseCase: gh<_i754.UpdateProfileUseCase>(),
          tokenStorage: gh<_i474.TokenStorageService>(),
        ));
    gh.factory<_i229.SignupRepoContract>(() => _i430.SignupRepoImpl(
        signUpDataSourceContract: gh<_i647.SignUpDataSourceContract>()));
    gh.factory<_i460.VerifyresetcodeRepo>(() => _i165.Verifyresetcoderepoimpl(
        gh<_i443.VerifyresetcodeRepoDataSource>()));
    gh.factory<_i498.ResetpasswordUsecase>(
        () => _i498.ResetpasswordUsecase(repo: gh<_i974.ResetpasswordRepo>()));
    gh.factory<_i524.ForgetPasswordUseCase>(() => _i524.ForgetPasswordUseCase(
        forgetPassword: gh<_i105.ForgetpasswordRepo>()));
    gh.factory<_i644.VerifyresetcodeUseCase>(() =>
        _i644.VerifyresetcodeUseCase(repo: gh<_i460.VerifyresetcodeRepo>()));
    gh.factory<_i459.SignupUsecase>(() => _i459.SignupUsecase(
        signupRepoContract: gh<_i229.SignupRepoContract>()));
    gh.factory<_i788.SigninUsecase>(() => _i788.SigninUsecase(
        signInRepoContract: gh<_i1006.SignInRepoContract>()));
    gh.factory<_i906.AuthCubit>(() => _i906.AuthCubit(
          verifyresetcodeUseCase: gh<_i644.VerifyresetcodeUseCase>(),
          resetpasswordUsecase: gh<_i498.ResetpasswordUsecase>(),
          signupUsecase: gh<_i459.SignupUsecase>(),
          forgetPasswordUseCase: gh<_i524.ForgetPasswordUseCase>(),
          signinUsecase: gh<_i788.SigninUsecase>(),
          tokenStorage: gh<_i474.TokenStorageService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
