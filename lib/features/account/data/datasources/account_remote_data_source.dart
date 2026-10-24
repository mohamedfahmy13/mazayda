import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../models/account_deletion_model.dart';

abstract class AccountRemoteDataSource {
  Future<AccountDeletionCheckModel> checkDeletion();

  /// `DELETE /account {password}` — بيرجّع رسالة النجاح المترجمة.
  ///
  /// الرفض بيوصل كـ `ServerException`: كلمة سر غلط تحت `errors.password`
  /// (422)، موانع بكود `ACCOUNT_DELETION_BLOCKED` و`data.blockers` (422)،
  /// وحساب موظّف بكود `STAFF_ACCOUNT` (403).
  Future<String?> deleteAccount(String password);
}

@LazySingleton(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final ApiClient client;
  AccountRemoteDataSourceImpl(this.client);

  @override
  Future<AccountDeletionCheckModel> checkDeletion() async {
    final data = await client.get(ApiConstants.accountDeletionCheck);
    return AccountDeletionCheckModel.fromJson(data as Map<String, dynamic>);
  }

  @override
  Future<String?> deleteAccount(String password) async {
    final res = await client.deleteEnvelope(
      ApiConstants.account,
      body: {'password': password},
    );
    return res.message;
  }
}
