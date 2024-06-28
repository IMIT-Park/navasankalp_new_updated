import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:navasankalp_application/app/data/provider/global_data_provider.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/themes/app_theme.dart';
import 'package:navasankalp_application/app/translations/app_translations.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/extensions.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_pref.dart';
import 'package:navasankalp_application/firebase_options.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/utils/widgets/app_drawer/drawer_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await getDevicetype();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    "Your device locale: ${Get.deviceLocale}".logStr(name: 'Locale');
    return GestureDetector(
      // Dismiss keyboard when clicked outside
      onTap: () => Common.dismissKeyboard(),
      child: GetMaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        onInit: () {
          
          
          Get.put(DrawersController());
        },
        initialRoute: AppRoutes.splash,
        theme: AppThemes.themData,
        getPages: AppPages.pages,
        locale: AppTranslation.locale,
        translationsKeys: AppTranslation.translations,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
