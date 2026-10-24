// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/account/data/datasources/account_remote_data_source.dart'
    as _i935;
import '../../features/account/data/repositories/account_repository_impl.dart'
    as _i857;
import '../../features/account/domain/repositories/account_repository.dart'
    as _i1067;
import '../../features/account/domain/usecases/account_deletion_usecases.dart'
    as _i1050;
import '../../features/account/presentation/cubit/account_deletion_cubit.dart'
    as _i701;
import '../../features/appeals/data/datasources/appeals_remote_data_source.dart'
    as _i459;
import '../../features/appeals/data/repositories/appeals_repository_impl.dart'
    as _i851;
import '../../features/appeals/domain/repositories/appeals_repository.dart'
    as _i1060;
import '../../features/appeals/domain/usecases/get_appeals.dart' as _i390;
import '../../features/appeals/domain/usecases/submit_appeal.dart' as _i896;
import '../../features/appeals/presentation/cubit/appeals_cubit.dart' as _i433;
import '../../features/auctions/data/datasources/auction_remote_data_source.dart'
    as _i838;
import '../../features/auctions/data/repositories/auction_repository_impl.dart'
    as _i837;
import '../../features/auctions/domain/repositories/auction_repository.dart'
    as _i793;
import '../../features/auctions/domain/usecases/get_auction_by_id.dart'
    as _i357;
import '../../features/auctions/domain/usecases/get_auctions.dart' as _i689;
import '../../features/auctions/presentation/cubit/auction_detail_cubit.dart'
    as _i79;
import '../../features/auctions/presentation/cubit/auctions_cubit.dart'
    as _i577;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/email_recovery_usecases.dart'
    as _i123;
import '../../features/auth/domain/usecases/login_user.dart' as _i778;
import '../../features/auth/domain/usecases/password_recovery_usecases.dart'
    as _i38;
import '../../features/auth/domain/usecases/register_user.dart' as _i198;
import '../../features/auth/domain/usecases/verify_otp.dart' as _i975;
import '../../features/auth/presentation/cubit/email_recovery_cubit.dart'
    as _i708;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
import '../../features/auth/presentation/cubit/otp_cubit.dart' as _i1035;
import '../../features/auth/presentation/cubit/password_recovery_cubit.dart'
    as _i648;
import '../../features/auth/presentation/cubit/register_cubit.dart' as _i759;
import '../../features/bidding/data/datasources/bidding_remote_data_source.dart'
    as _i620;
import '../../features/bidding/data/repositories/bidding_repository_impl.dart'
    as _i735;
import '../../features/bidding/domain/repositories/bidding_repository.dart'
    as _i582;
import '../../features/bidding/domain/usecases/bidding_usecases.dart' as _i581;
import '../../features/bidding/presentation/cubit/bidding_cubit.dart' as _i108;
import '../../features/commercial_register/data/datasources/commercial_register_remote_data_source.dart'
    as _i798;
import '../../features/commercial_register/data/repositories/commercial_register_repository_impl.dart'
    as _i970;
import '../../features/commercial_register/domain/repositories/commercial_register_repository.dart'
    as _i95;
import '../../features/commercial_register/domain/usecases/commercial_register_usecases.dart'
    as _i624;
import '../../features/commercial_register/presentation/cubit/commercial_register_cubit.dart'
    as _i972;
import '../../features/documents/data/datasources/documents_remote_data_source.dart'
    as _i757;
import '../../features/documents/data/repositories/documents_repository_impl.dart'
    as _i270;
import '../../features/documents/domain/repositories/documents_repository.dart'
    as _i345;
import '../../features/documents/domain/usecases/documents_usecases.dart'
    as _i301;
import '../../features/documents/presentation/cubit/documents_cubit.dart'
    as _i783;
import '../../features/kyc/data/datasources/kyc_remote_data_source.dart'
    as _i789;
import '../../features/kyc/data/repositories/kyc_repository_impl.dart' as _i832;
import '../../features/kyc/domain/repositories/kyc_repository.dart' as _i1017;
import '../../features/kyc/domain/usecases/kyc_usecases.dart' as _i829;
import '../../features/kyc/presentation/cubit/kyc_cubit.dart' as _i700;
import '../../features/my_auctions/data/datasources/my_auctions_remote_data_source.dart'
    as _i510;
import '../../features/my_auctions/data/repositories/my_auctions_repository_impl.dart'
    as _i685;
import '../../features/my_auctions/domain/repositories/my_auctions_repository.dart'
    as _i489;
import '../../features/my_auctions/domain/usecases/get_my_auctions.dart'
    as _i919;
import '../../features/my_auctions/presentation/cubit/my_auctions_cubit.dart'
    as _i115;
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart'
    as _i951;
import '../../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i201;
import '../../features/notifications/domain/repositories/notifications_repository.dart'
    as _i563;
import '../../features/notifications/domain/usecases/notifications_usecases.dart'
    as _i460;
import '../../features/notifications/presentation/cubit/notification_preferences_cubit.dart'
    as _i1034;
import '../../features/notifications/presentation/cubit/notifications_cubit.dart'
    as _i405;
import '../../features/payments/data/datasources/payments_remote_data_source.dart'
    as _i340;
import '../../features/payments/data/repositories/payments_repository_impl.dart'
    as _i565;
import '../../features/payments/domain/repositories/payments_repository.dart'
    as _i663;
import '../../features/payments/domain/usecases/payments_usecases.dart'
    as _i306;
import '../../features/payments/presentation/cubit/final_payment_preview_cubit.dart'
    as _i212;
import '../../features/payments/presentation/cubit/payment_flow_cubit.dart'
    as _i462;
import '../../features/premium/data/datasources/premium_remote_data_source.dart'
    as _i1054;
import '../../features/premium/data/repositories/premium_repository_impl.dart'
    as _i637;
import '../../features/premium/domain/repositories/premium_repository.dart'
    as _i260;
import '../../features/premium/domain/usecases/premium_usecases.dart' as _i280;
import '../../features/premium/presentation/cubit/premium_cubit.dart' as _i640;
import '../../features/profile/data/datasources/profile_remote_data_source.dart'
    as _i847;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_profile.dart' as _i72;
import '../../features/profile/domain/usecases/update_profile.dart' as _i78;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import '../../features/qa/data/datasources/qa_remote_data_source.dart' as _i92;
import '../../features/qa/data/repositories/qa_repository_impl.dart' as _i1033;
import '../../features/qa/domain/repositories/qa_repository.dart' as _i420;
import '../../features/qa/presentation/cubit/qa_cubit.dart' as _i487;
import '../connectivity/connectivity_cubit.dart' as _i690;
import '../network/api_client.dart' as _i557;
import '../network/token_storage.dart' as _i964;
import '../notifications/device_registrar.dart' as _i860;
import '../notifications/push_notification_service.dart' as _i269;
import '../realtime/pusher_realtime_service.dart' as _i346;
import '../realtime/realtime_config.dart' as _i867;
import '../realtime/realtime_service.dart' as _i854;
import '../session/account_cache.dart' as _i141;
import '../session/session_manager.dart' as _i432;
import '../utils/locale_cubit.dart' as _i218;
import '../utils/locale_sync.dart' as _i209;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i269.PushNotificationService>(
      () => _i269.PushNotificationService(),
    );
    gh.lazySingleton<_i964.TokenStorage>(
      () => _i964.TokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i141.AccountCache>(
      () => _i141.AccountCache(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i218.LocaleCubit>(
      () => _i218.LocaleCubit(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i432.SessionManager>(
      () => _i432.SessionManager(
        gh<_i964.TokenStorage>(),
        gh<_i141.AccountCache>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i557.ApiClient>(
      () => _i557.ApiClient(
        gh<_i964.TokenStorage>(),
        gh<_i432.SessionManager>(),
        gh<_i218.LocaleCubit>(),
      ),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i92.QaRemoteDataSource>(
      () => _i92.QaRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i1054.PremiumRemoteDataSource>(
      () => _i1054.PremiumRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i838.AuctionRemoteDataSource>(
      () => _i838.AuctionRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i789.KycRemoteDataSource>(
      () => _i789.KycRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i690.ConnectivityCubit>(
      () => _i690.ConnectivityCubit(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i935.AccountRemoteDataSource>(
      () => _i935.AccountRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i1017.KycRepository>(
      () => _i832.KycRepositoryImpl(gh<_i789.KycRemoteDataSource>()),
    );
    gh.lazySingleton<_i798.CommercialRegisterRemoteDataSource>(
      () => _i798.CommercialRegisterRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i1067.AccountRepository>(
      () => _i857.AccountRepositoryImpl(
        gh<_i935.AccountRemoteDataSource>(),
        gh<_i432.SessionManager>(),
      ),
    );
    gh.lazySingleton<_i340.PaymentsRemoteDataSource>(
      () => _i340.PaymentsRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i847.ProfileRemoteDataSource>(
      () => _i847.ProfileRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i510.MyAuctionsRemoteDataSource>(
      () => _i510.MyAuctionsRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i757.DocumentsRemoteDataSource>(
      () => _i757.DocumentsRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i620.BiddingRemoteDataSource>(
      () => _i620.BiddingRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i459.AppealsRemoteDataSource>(
      () => _i459.AppealsRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i860.DeviceRegistrar>(
      () => _i860.DeviceRegistrar(
        gh<_i557.ApiClient>(),
        gh<_i269.PushNotificationService>(),
        gh<_i964.TokenStorage>(),
        gh<_i432.SessionManager>(),
      ),
    );
    gh.lazySingleton<_i582.BiddingRepository>(
      () => _i735.BiddingRepositoryImpl(gh<_i620.BiddingRemoteDataSource>()),
    );
    gh.lazySingleton<_i951.NotificationsRemoteDataSource>(
      () => _i951.NotificationsRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i489.MyAuctionsRepository>(
      () => _i685.MyAuctionsRepositoryImpl(
        gh<_i510.MyAuctionsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i563.NotificationsRepository>(
      () => _i201.NotificationsRepositoryImpl(
        gh<_i951.NotificationsRemoteDataSource>(),
      ),
    );
    gh.factory<_i919.GetMyAuctions>(
      () => _i919.GetMyAuctions(gh<_i489.MyAuctionsRepository>()),
    );
    gh.lazySingleton<_i663.PaymentsRepository>(
      () => _i565.PaymentsRepositoryImpl(gh<_i340.PaymentsRemoteDataSource>()),
    );
    gh.lazySingleton<_i260.PremiumRepository>(
      () => _i637.PremiumRepositoryImpl(gh<_i1054.PremiumRemoteDataSource>()),
    );
    gh.lazySingleton<_i867.RealtimeConfigProvider>(
      () => _i867.RealtimeConfigProvider(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i345.DocumentsRepository>(
      () =>
          _i270.DocumentsRepositoryImpl(gh<_i757.DocumentsRemoteDataSource>()),
    );
    gh.lazySingleton<_i793.AuctionRepository>(
      () => _i837.AuctionRepositoryImpl(gh<_i838.AuctionRemoteDataSource>()),
    );
    gh.factory<_i581.GetLatestBids>(
      () => _i581.GetLatestBids(gh<_i582.BiddingRepository>()),
    );
    gh.factory<_i581.GetPrice>(
      () => _i581.GetPrice(gh<_i582.BiddingRepository>()),
    );
    gh.factory<_i581.PlaceBid>(
      () => _i581.PlaceBid(gh<_i582.BiddingRepository>()),
    );
    gh.lazySingleton<_i854.RealtimeService>(
      () => _i346.PusherRealtimeService(
        gh<_i867.RealtimeConfigProvider>(),
        gh<_i964.TokenStorage>(),
      ),
    );
    gh.factory<_i829.GetKycStatus>(
      () => _i829.GetKycStatus(gh<_i1017.KycRepository>()),
    );
    gh.factory<_i829.UploadKycDocument>(
      () => _i829.UploadKycDocument(gh<_i1017.KycRepository>()),
    );
    gh.factory<_i829.SubmitKyc>(
      () => _i829.SubmitKyc(gh<_i1017.KycRepository>()),
    );
    gh.factory<_i829.GetWilayas>(
      () => _i829.GetWilayas(gh<_i1017.KycRepository>()),
    );
    gh.factory<_i829.GetCommunes>(
      () => _i829.GetCommunes(gh<_i1017.KycRepository>()),
    );
    gh.lazySingleton<_i95.CommercialRegisterRepository>(
      () => _i970.CommercialRegisterRepositoryImpl(
        gh<_i798.CommercialRegisterRemoteDataSource>(),
      ),
    );
    gh.factory<_i624.GetCommercialRegister>(
      () =>
          _i624.GetCommercialRegister(gh<_i95.CommercialRegisterRepository>()),
    );
    gh.factory<_i624.SubmitCommercialRegister>(
      () => _i624.SubmitCommercialRegister(
        gh<_i95.CommercialRegisterRepository>(),
      ),
    );
    gh.factory<_i301.GetDocuments>(
      () => _i301.GetDocuments(gh<_i345.DocumentsRepository>()),
    );
    gh.factory<_i301.GetDocumentsSummary>(
      () => _i301.GetDocumentsSummary(gh<_i345.DocumentsRepository>()),
    );
    gh.factory<_i301.GetDocumentFilterOptions>(
      () => _i301.GetDocumentFilterOptions(gh<_i345.DocumentsRepository>()),
    );
    gh.factory<_i301.DownloadDocument>(
      () => _i301.DownloadDocument(gh<_i345.DocumentsRepository>()),
    );
    gh.factory<_i783.DocumentsCubit>(
      () => _i783.DocumentsCubit(
        gh<_i301.GetDocuments>(),
        gh<_i301.GetDocumentsSummary>(),
        gh<_i301.DownloadDocument>(),
        gh<_i301.GetDocumentFilterOptions>(),
      ),
    );
    gh.lazySingleton<_i209.LocaleSync>(
      () => _i209.LocaleSync(
        gh<_i557.ApiClient>(),
        gh<_i964.TokenStorage>(),
        gh<_i218.LocaleCubit>(),
      ),
    );
    gh.factory<_i1050.CheckAccountDeletion>(
      () => _i1050.CheckAccountDeletion(gh<_i1067.AccountRepository>()),
    );
    gh.factory<_i1050.DeleteAccount>(
      () => _i1050.DeleteAccount(gh<_i1067.AccountRepository>()),
    );
    gh.lazySingleton<_i420.QaRepository>(
      () => _i1033.QaRepositoryImpl(gh<_i92.QaRemoteDataSource>()),
    );
    gh.factory<_i306.BuyBook>(
      () => _i306.BuyBook(gh<_i663.PaymentsRepository>()),
    );
    gh.factory<_i306.RegisterInAuction>(
      () => _i306.RegisterInAuction(gh<_i663.PaymentsRepository>()),
    );
    gh.factory<_i306.StartFinalPayment>(
      () => _i306.StartFinalPayment(gh<_i663.PaymentsRepository>()),
    );
    gh.factory<_i306.GetFinalPaymentPreview>(
      () => _i306.GetFinalPaymentPreview(gh<_i663.PaymentsRepository>()),
    );
    gh.factory<_i306.GetPaymentStatus>(
      () => _i306.GetPaymentStatus(gh<_i663.PaymentsRepository>()),
    );
    gh.factory<_i280.GetPremiumOverview>(
      () => _i280.GetPremiumOverview(gh<_i260.PremiumRepository>()),
    );
    gh.factory<_i280.SubscribeToPlan>(
      () => _i280.SubscribeToPlan(gh<_i260.PremiumRepository>()),
    );
    gh.factory<_i280.CancelAutoRenew>(
      () => _i280.CancelAutoRenew(gh<_i260.PremiumRepository>()),
    );
    gh.factory<_i460.GetNotifications>(
      () => _i460.GetNotifications(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i460.MarkNotificationRead>(
      () => _i460.MarkNotificationRead(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i460.MarkAllNotificationsRead>(
      () => _i460.MarkAllNotificationsRead(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i460.GetNotificationPreferences>(
      () =>
          _i460.GetNotificationPreferences(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i460.UpdateNotificationPreferences>(
      () => _i460.UpdateNotificationPreferences(
        gh<_i563.NotificationsRepository>(),
      ),
    );
    gh.factory<_i462.PaymentFlowCubit>(
      () => _i462.PaymentFlowCubit(
        gh<_i306.BuyBook>(),
        gh<_i306.RegisterInAuction>(),
        gh<_i306.StartFinalPayment>(),
        gh<_i306.GetPaymentStatus>(),
      ),
    );
    gh.factory<_i115.MyAuctionsCubit>(
      () => _i115.MyAuctionsCubit(gh<_i919.GetMyAuctions>()),
    );
    gh.factory<_i972.CommercialRegisterCubit>(
      () => _i972.CommercialRegisterCubit(
        gh<_i624.GetCommercialRegister>(),
        gh<_i624.SubmitCommercialRegister>(),
      ),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(
        gh<_i847.ProfileRemoteDataSource>(),
        gh<_i141.AccountCache>(),
      ),
    );
    gh.factory<_i420.GetQuestions>(
      () => _i420.GetQuestions(gh<_i420.QaRepository>()),
    );
    gh.factory<_i420.AskQuestion>(
      () => _i420.AskQuestion(gh<_i420.QaRepository>()),
    );
    gh.factory<_i405.NotificationsCubit>(
      () => _i405.NotificationsCubit(
        gh<_i460.GetNotifications>(),
        gh<_i460.MarkNotificationRead>(),
        gh<_i460.MarkAllNotificationsRead>(),
        gh<_i269.PushNotificationService>(),
        gh<_i218.LocaleCubit>(),
      ),
    );
    gh.factory<_i72.GetProfile>(
      () => _i72.GetProfile(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i78.UpdateProfile>(
      () => _i78.UpdateProfile(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i108.BiddingCubit>(
      () => _i108.BiddingCubit(
        gh<_i581.GetLatestBids>(),
        gh<_i581.GetPrice>(),
        gh<_i581.PlaceBid>(),
        gh<_i854.RealtimeService>(),
      ),
    );
    gh.factory<_i1034.NotificationPreferencesCubit>(
      () => _i1034.NotificationPreferencesCubit(
        gh<_i460.GetNotificationPreferences>(),
        gh<_i460.UpdateNotificationPreferences>(),
      ),
    );
    gh.factory<_i640.PremiumCubit>(
      () => _i640.PremiumCubit(
        gh<_i280.GetPremiumOverview>(),
        gh<_i280.SubscribeToPlan>(),
        gh<_i280.CancelAutoRenew>(),
        gh<_i141.AccountCache>(),
      ),
    );
    gh.lazySingleton<_i1060.AppealsRepository>(
      () => _i851.AppealsRepositoryImpl(gh<_i459.AppealsRemoteDataSource>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i964.TokenStorage>(),
        gh<_i860.DeviceRegistrar>(),
        gh<_i432.SessionManager>(),
        gh<_i209.LocaleSync>(),
      ),
    );
    gh.factory<_i212.FinalPaymentPreviewCubit>(
      () => _i212.FinalPaymentPreviewCubit(gh<_i306.GetFinalPaymentPreview>()),
    );
    gh.factory<_i357.GetAuctionById>(
      () => _i357.GetAuctionById(gh<_i793.AuctionRepository>()),
    );
    gh.factory<_i689.GetAuctions>(
      () => _i689.GetAuctions(gh<_i793.AuctionRepository>()),
    );
    gh.factory<_i701.AccountDeletionCubit>(
      () => _i701.AccountDeletionCubit(
        gh<_i1050.CheckAccountDeletion>(),
        gh<_i1050.DeleteAccount>(),
      ),
    );
    gh.factory<_i700.KycCubit>(
      () => _i700.KycCubit(
        gh<_i829.GetKycStatus>(),
        gh<_i829.UploadKycDocument>(),
        gh<_i829.SubmitKyc>(),
        gh<_i829.GetWilayas>(),
        gh<_i829.GetCommunes>(),
        gh<_i72.GetProfile>(),
      ),
    );
    gh.factory<_i79.AuctionDetailCubit>(
      () => _i79.AuctionDetailCubit(
        gh<_i357.GetAuctionById>(),
        gh<_i72.GetProfile>(),
        gh<_i432.SessionManager>(),
        gh<_i141.AccountCache>(),
      ),
    );
    gh.factory<_i577.AuctionsCubit>(
      () =>
          _i577.AuctionsCubit(gh<_i689.GetAuctions>(), gh<_i829.GetWilayas>()),
    );
    gh.factory<_i390.GetAppeals>(
      () => _i390.GetAppeals(gh<_i1060.AppealsRepository>()),
    );
    gh.factory<_i896.SubmitAppeal>(
      () => _i896.SubmitAppeal(gh<_i1060.AppealsRepository>()),
    );
    gh.factory<_i487.QaCubit>(
      () => _i487.QaCubit(gh<_i420.GetQuestions>(), gh<_i420.AskQuestion>()),
    );
    gh.factory<_i123.SubmitEmailRecovery>(
      () => _i123.SubmitEmailRecovery(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i123.GetEmailRecoveryStatus>(
      () => _i123.GetEmailRecoveryStatus(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i778.LoginUser>(
      () => _i778.LoginUser(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i778.GetCurrentUser>(
      () => _i778.GetCurrentUser(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i778.LogoutUser>(
      () => _i778.LogoutUser(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i38.RequestPasswordReset>(
      () => _i38.RequestPasswordReset(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i38.VerifyPasswordReset>(
      () => _i38.VerifyPasswordReset(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i38.RevealSecretQuestion>(
      () => _i38.RevealSecretQuestion(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i38.RecoverBySecret>(
      () => _i38.RecoverBySecret(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i198.RegisterUser>(
      () => _i198.RegisterUser(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i975.VerifyOtp>(
      () => _i975.VerifyOtp(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i975.ResendOtp>(
      () => _i975.ResendOtp(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i433.AppealsCubit>(
      () =>
          _i433.AppealsCubit(gh<_i390.GetAppeals>(), gh<_i896.SubmitAppeal>()),
    );
    gh.factory<_i759.RegisterCubit>(
      () => _i759.RegisterCubit(gh<_i198.RegisterUser>()),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(
        gh<_i72.GetProfile>(),
        gh<_i78.UpdateProfile>(),
        gh<_i778.LogoutUser>(),
      ),
    );
    gh.factory<_i708.EmailRecoveryCubit>(
      () => _i708.EmailRecoveryCubit(
        gh<_i123.SubmitEmailRecovery>(),
        gh<_i123.GetEmailRecoveryStatus>(),
      ),
    );
    gh.factory<_i648.PasswordRecoveryCubit>(
      () => _i648.PasswordRecoveryCubit(
        gh<_i38.RequestPasswordReset>(),
        gh<_i38.VerifyPasswordReset>(),
        gh<_i38.RevealSecretQuestion>(),
        gh<_i38.RecoverBySecret>(),
      ),
    );
    gh.factory<_i1035.OtpCubit>(
      () => _i1035.OtpCubit(gh<_i975.VerifyOtp>(), gh<_i975.ResendOtp>()),
    );
    gh.factory<_i69.LoginCubit>(() => _i69.LoginCubit(gh<_i778.LoginUser>()));
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
