import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/history_model.dart';
import 'package:navasankalp_application/app/data/model/notification_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';

import '../model/account_model.dart';

class GlobalDataProvider {
  GlobalDataProvider();
  List<HistoryModel> historydata = [];
  List<NotificationModel> notificationdata = [];
    AccountModel accountmodel = AccountModel();

  final NavaSankalpBEProvider _backendProvider = Get.find<NavaSankalpBEProvider>();

  Future<List<NotificationModel>> getNotification() async {
    notificationdata = await _backendProvider.getNotification();
    return notificationdata;
  }
 Future<AccountModel> getAccountData() async {
  accountmodel = await _backendProvider.getAccountDetails();
  return accountmodel;
 }
}
