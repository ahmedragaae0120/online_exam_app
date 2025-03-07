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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/data_source_contract/ForgetPassword_dataSourses/ForgetPassword_dataSourse.dart'
    as _i42;
import '../../data/data_source_contract/ForgetPassword_dataSourses/ResetpasswordDataSourceRepo.dart'
    as _i865;
import '../../data/data_source_contract/ForgetPassword_dataSourses/VerifyresetcodeRepoDataSource.dart'
    as _i443;
import '../../data/data_source_contract/questions%20_datasource/questions_datasource_contract.dart'
    as _i416;
import '../../data/data_source_contract/Results/AddResultRepo.dart' as _i1004;
import '../../data/data_source_contract/Results/DeleteResultRepo.dart' as _i739;
import '../../data/data_source_contract/Results/GetResultsByIdRepo.dart'
    as _i582;
import '../../data/data_source_contract/Results/GetResultsDataSourceRepo.dart'
    as _i521;
import '../../data/data_source_contract/signin_datasource.dart' as _i1072;
import '../../data/data_source_contract/signup_datasource.dart' as _i647;
import '../../data/data_source_impl/ForgetPassword/ForgetPassWord.dart'
    as _i444;
import '../../data/data_source_impl/ForgetPassword/ResetpasswordDataSourceRepoImpl.dart'
    as _i66;
import '../../data/data_source_impl/ForgetPassword/VerifyresetcodeRepoDataSourceImpl.dart'
    as _i695;
import '../../data/data_source_impl/questions%20_datasource_impl/questions_datasource_impl.dart'
    as _i662;
import '../../data/data_source_impl/Results/AddResultDataSourceRepoImpl.dart'
    as _i492;
import '../../data/data_source_impl/Results/Delete%20ResultDataSourceRepoImpl.dart'
    as _i441;
import '../../data/data_source_impl/Results/GetResultsByIdDataSourceRepoImpl.dart'
    as _i800;
import '../../data/data_source_impl/Results/GetResultsDataSourceRepoImpl.dart'
    as _i350;
import '../../data/data_source_impl/signin_datasource_impl.dart' as _i64;
import '../../data/data_source_impl/signup_datasource_impl.dart' as _i648;
import '../../data/repo_impl/Forget%20Password%20Impl/ForgetPasswordRepoImpl.dart'
    as _i455;
import '../../data/repo_impl/Forget%20Password%20Impl/ResetpasswordRepoImpl.dart'
    as _i343;
import '../../data/repo_impl/Forget%20Password%20Impl/VerifyresetcodeRepoImpl.dart'
    as _i165;
import '../../data/repo_impl/Results/AddResultRepoImpl.dart' as _i758;
import '../../data/repo_impl/Results/Delete%20ResultRepoImpl.dart' as _i158;
import '../../data/repo_impl/Results/GetResultsByIdRepoImpl.dart' as _i101;
import '../../data/repo_impl/Results/GetResultsRepoImpl.dart' as _i68;
import '../../data/repo_impl/signin_repo_impl.dart' as _i209;
import '../../data/repo_impl/signup_repo_impl.dart' as _i430;
import '../../domain/repo_contract/Forget%20Password%20Repos/ForgetPassword_repo.dart'
    as _i105;
import '../../domain/repo_contract/Forget%20Password%20Repos/resetPasswordRepo.dart'
    as _i974;
import '../../domain/repo_contract/Forget%20Password%20Repos/verifyResetCodeRepo.dart'
    as _i460;
import '../../domain/repo_contract/questions_repo_contract/questions_repo_contract.dart'
    as _i1030;
import '../../domain/repo_contract/Results/AddResultRepo.dart' as _i836;
import '../../domain/repo_contract/Results/DeleteResultRepo.dart' as _i1044;
import '../../domain/repo_contract/Results/GetResultsByIdRepo.dart' as _i46;
import '../../domain/repo_contract/Results/GetResultsRepo.dart' as _i622;
import '../../domain/repo_contract/sign_in_repo_contract.dart' as _i1006;
import '../../domain/repo_contract/signup_repo_contract.dart' as _i229;
import '../../domain/use_cases/check_answers_usecase.dart' as _i558;
import '../../domain/use_cases/Forget%20Password%20Use%20Cases/ForgetPassword_Use_Case.dart'
    as _i524;
import '../../domain/use_cases/Forget%20Password%20Use%20Cases/resetPassword_UseCase.dart'
    as _i498;
import '../../domain/use_cases/Forget%20Password%20Use%20Cases/verifyResetCodeUseCase.dart'
    as _i644;
import '../../domain/use_cases/get_questions_usecase.dart' as _i848;
import '../../domain/use_cases/Results/AddResultUseCase.dart' as _i941;
import '../../domain/use_cases/Results/Delete%20Result.dart' as _i365;
import '../../domain/use_cases/Results/GetResults.dart' as _i54;
import '../../domain/use_cases/Results/GetResultsByIdUseCase.dart' as _i714;
import '../../domain/use_cases/signin_usecase.dart' as _i788;
import '../../domain/use_cases/signup_usecase.dart' as _i459;
import '../../ui/Auth/view_model/cubit/auth_cubit.dart' as _i906;
import '../../ui/exam_screen/view_model/questions_cubit.dart' as _i971;
import '../../ui/resultsScreen/VeiwModel/result_cubit.dart' as _i634;
import '../api/api_manager.dart' as _i1047;
import '../services/DataBaseHelper.dart' as _i542;
import '../services/token_storage_service.dart' as _i474;
import '../services/user_service.dart' as _i381;
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
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i381.UserService>(() => _i381.UserService());
    gh.singleton<_i474.TokenStorageService>(
        () => _i474.TokenStorageService(gh<_i460.SharedPreferences>()));
    gh.singleton<_i542.DatabaseHelper>(
        () => _i542.DatabaseHelper(gh<_i381.UserService>()));
    gh.factory<_i1004.AddResultDataSourceRepo>(
        () => _i492.AddResultDataSourceRepoImpl());
    gh.singleton<_i1047.ApiManager>(
        () => _i1047.ApiManager(gh<_i474.TokenStorageService>()));
    gh.factory<_i739.DeleteResultDataSourceRepo>(
        () => _i441.DeleteResultDataSourceRepoImpl());
    gh.factory<_i1044.DeleteResultRepo>(() =>
        _i158.DeleteResultRepoImpl(gh<_i739.DeleteResultDataSourceRepo>()));
    gh.factory<_i582.GetResultsByIdDataSourceRepo>(
        () => _i800.GetResultsByIdDataSourceRepoImpl());
    gh.factory<_i521.GetResultsDataSourceRepo>(
        () => _i350.GetResultsDataSourceRepoImpl());
    gh.factory<_i836.AddResultRepo>(
        () => _i758.AddResultRepoImpl(gh<_i1004.AddResultDataSourceRepo>()));
    gh.factory<_i1072.SignInDataSourceContract>(() => _i64.SigninDatasourceImpl(
          gh<_i1047.ApiManager>(),
          gh<_i474.TokenStorageService>(),
          gh<_i381.UserService>(),
        ));
    gh.factory<_i647.SignUpDataSourceContract>(
        () => _i648.SignUpDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1006.SignInRepoContract>(
        () => _i209.SigninRepoImpl(gh<_i1072.SignInDataSourceContract>()));
    gh.factory<_i42.ForgetpasswordDataSourseRepo>(() =>
        _i444.ForgetpasswordDataSourceRepoImpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i443.VerifyresetcodeRepoDataSource>(() =>
        _i695.Verifyresetcoderepodatasourceimpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i365.DeleteResultUseCase>(
        () => _i365.DeleteResultUseCase(gh<_i1044.DeleteResultRepo>()));
    gh.factory<_i416.QuestionsDatasourceContract>(
        () => _i662.QuestionsDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i229.SignupRepoContract>(() => _i430.SignupRepoImpl(
        signUpDataSourceContract: gh<_i647.SignUpDataSourceContract>()));
    gh.factory<_i865.ResetpasswordDataSourceRepo>(() =>
        _i66.Resetpassworddatasourcerepoimpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i941.AddResultUseCase>(
        () => _i941.AddResultUseCase(gh<_i836.AddResultRepo>()));
    gh.factory<_i460.VerifyresetcodeRepo>(() => _i165.Verifyresetcoderepoimpl(
        gh<_i443.VerifyresetcodeRepoDataSource>()));
    gh.factory<_i46.GetResultsByIdRepo>(() =>
        _i101.GetResultsByIdRepoImpl(gh<_i582.GetResultsByIdDataSourceRepo>()));
    gh.factory<_i974.ResetpasswordRepo>(() =>
        _i343.Resetpasswordrepoimpl(gh<_i865.ResetpasswordDataSourceRepo>()));
    gh.factory<_i1030.QuestionsRepoContract>(
        () => QuestionsRepoImpl(gh<_i416.QuestionsDatasourceContract>()));
    gh.factory<_i105.ForgetpasswordRepo>(() => _i455.Forgetpasswordrepoimpl(
        forgetpassword_data_sourse_repo:
            gh<_i42.ForgetpasswordDataSourseRepo>()));
    gh.factory<_i714.GetResultsByIdUseCase>(
        () => _i714.GetResultsByIdUseCase(gh<_i46.GetResultsByIdRepo>()));
    gh.factory<_i644.VerifyresetcodeUseCase>(() =>
        _i644.VerifyresetcodeUseCase(repo: gh<_i460.VerifyresetcodeRepo>()));
    gh.factory<_i622.GetResultsRepo>(
        () => _i68.GetResultsRepoImpl(gh<_i521.GetResultsDataSourceRepo>()));
    gh.factory<GetQuestionsUseCase>(
        () => GetQuestionsUseCase(gh<_i1030.QuestionsRepoContract>()));
    gh.factory<CheckAnswersUsecase>(
        () => CheckAnswersUsecase(gh<_i1030.QuestionsRepoContract>()));
    gh.factory<_i459.SignupUsecase>(() => _i459.SignupUsecase(
        signupRepoContract: gh<_i229.SignupRepoContract>()));
    gh.factory<_i788.SigninUsecase>(() => _i788.SigninUsecase(
        signInRepoContract: gh<_i1006.SignInRepoContract>()));
    gh.factory<_i54.GetResultsUseCase>(
        () => _i54.GetResultsUseCase(gh<_i622.GetResultsRepo>()));
    gh.factory<_i498.ResetpasswordUsecase>(
        () => _i498.ResetpasswordUsecase(repo: gh<_i974.ResetpasswordRepo>()));
    gh.factory<_i524.ForgetPasswordUseCase>(() => _i524.ForgetPasswordUseCase(
        forgetPassword: gh<_i105.ForgetpasswordRepo>()));
    gh.factory<_i634.ResultCubit>(() => _i634.ResultCubit(
          gh<_i365.DeleteResultUseCase>(),
          gh<_i714.GetResultsByIdUseCase>(),
          gh<_i54.GetResultsUseCase>(),
        ));
    gh.factory<_i971.QuestionsCubit>(() => _i971.QuestionsCubit(
          gh<_i941.AddResultUseCase>(),
          gh<_i54.GetResultsUseCase>(),
          gh<_i848.GetQuestionsUseCase>(),
          gh<_i558.CheckAnswersUsecase>(),
        ));
    gh.factory<_i906.AuthCubit>(() => _i906.AuthCubit(
          verifyresetcodeUseCase: gh<_i644.VerifyresetcodeUseCase>(),
          resetpasswordUsecase: gh<_i498.ResetpasswordUsecase>(),
          signupUsecase: gh<_i459.SignupUsecase>(),
          forgetPasswordUseCase: gh<_i524.ForgetPasswordUseCase>(),
          signinUsecase: gh<_i788.SigninUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
