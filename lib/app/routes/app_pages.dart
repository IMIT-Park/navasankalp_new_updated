import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/account_module/account_binding.dart';
import 'package:navasankalp_application/app/modules/account_module/account_page.dart';
import 'package:navasankalp_application/app/modules/app_notification_module/app_notification_binding.dart';
import 'package:navasankalp_application/app/modules/app_notification_module/app_notification_page.dart';
import 'package:navasankalp_application/app/modules/directory_module/directory_binding.dart';
import 'package:navasankalp_application/app/modules/directory_module/directory_page.dart';
import 'package:navasankalp_application/app/modules/history_module/history_binding.dart';
import 'package:navasankalp_application/app/modules/history_module/history_page.dart';
import 'package:navasankalp_application/app/modules/home_module/home_binding.dart';
import 'package:navasankalp_application/app/modules/home_module/home_page.dart';
import 'package:navasankalp_application/app/modules/login_module/login_binding.dart';
import 'package:navasankalp_application/app/modules/login_module/login_page.dart';
import 'package:navasankalp_application/app/modules/privacy_policy_module/privacy_policy_page.dart';
import 'package:navasankalp_application/app/modules/slogan_module/slogan_binding.dart';
import 'package:navasankalp_application/app/modules/slogan_module/slogan_page.dart';
import 'package:navasankalp_application/app/modules/splash_module/splash_page.dart';
import 'package:navasankalp_application/app/modules/transaction_module/transaction_binding.dart';
import 'package:navasankalp_application/app/modules/transaction_module/transaction_page.dart';
import 'package:navasankalp_application/app/utils/widgets/app_drawer/app_drawer.dart';

part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.account,
      page: () => const AccountPage(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () =>  const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.privacypolicy,
      page: () => const PrivacyPolicyPage(),
    ),
    GetPage(
      name: AppRoutes.slogan,
      page: () => const SloganPage(),
      binding: SloganBinding(),
    ),
    GetPage(
      name: AppRoutes.transaction,
      page: () => const TransactionPage(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: AppRoutes.directory,
      page: () => const DirectoryPage(),
      binding: DirectoryBinding(),
    ),
    GetPage(
      name: AppRoutes.drawer,
      page: () => const CustomAppDrawer(),
    ),
  ];
}
