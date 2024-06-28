import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/notification_model.dart';
import 'package:navasankalp_application/app/data/provider/global_data_provider.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/services/FirebaseMessagingServices.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_pref.dart';

class NotificationController extends GetxController {
  final GlobalDataProvider _globalDataProvider = GlobalDataProvider();
  final NavaSankalpBEProvider _provider = NavaSankalpBEProvider();
  final FirebaseMessagingService _firebaseMessagingService =
      FirebaseMessagingService();

  // RxList<NotificationModel> notificationlist = <NotificationModel>[].obs;
  final notificationList = List<NotificationModel>.empty(growable: true).obs;
  final _pref = NavaSankalpPref();
  final RxBool showImage = true.obs;

  void changeIcon(int index) {
    showImage.value = !showImage.value;
  }

  void handleNotification(NotificationModel notification) {
    notificationList.add(notification);
    print('Notification added: ${notification.userId}');
    update(); // Notify listeners that the list has changed
  }

  void handleNotificationTap(NotificationModel notification) {
    // Handle the tap event, e.g., open a link or navigate to a specific screen
  }

  void removeNotification(int index) {
    if (index >= 0 && index < notificationList.length) {
      notificationList.removeAt(index);
      update(); // Notify listeners that the list has changed
    }
  }

  void initialize() async {
    _firebaseMessagingService.configureFirebaseMessaging(handleNotification);
    // _firebaseMessagingService.initializeNotifications();
    String? token = await FirebaseMessaging.instance.getToken();
    await Future.delayed(const Duration(seconds: 2), () {
      _pref.devicetoken.val = token ?? "";
    });
    _pref.devicetoken.val = token ?? "";
    print('Device Token: $token');
  }

  NotificationController() {
    notificationList.value = _globalDataProvider.notificationdata;
  }
  Future getNotification() async {
    notificationList.value = await _globalDataProvider.getNotification();
  }

  final readStatusRequest = NoficationReadRequestModel();

  Future changeNotificationStatus(int notificationId) async {
    readStatusRequest.notificationId = notificationId;
    await _provider.changeNotificationRequest(readStatusRequest);
  }

  @override
  void onReady() {
    super.onReady();
    final pref = NavaSankalpPref();
    if (pref.accessToken.val.isNotEmpty) {
      if (notificationList.isEmpty) {
        Common.safeApiCall(getNotification());
      } else {
        Common.safeApiCall(getNotification(), showBloackingUI: false);
      }
    }
  }
}
