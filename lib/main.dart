import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galleon_user/constant/strings.dart';
import 'package:galleon_user/helper/local_database_helper/local_database_helper.dart';
import 'package:galleon_user/services/translations/app_translations.dart';
import 'package:galleon_user/theme/theme_controller.dart';
import 'package:galleon_user/utility/utility.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'constant/hive_box_names.dart';
import 'firebase_options.dart';
import 'helper/connectivity_helper/connectivity_service.dart';
import 'helper/database_helper/database_helper.dart';
import 'helper/storage_handler/storage_data_handler.dart';
import 'helper/storage_handler/storage_getters_setters.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPreAppServices();
  runApplication();
}

void runApplication() {
  AppUtility.log('Initializing App');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());

  Get.put(ConnectivityService());

  AppUtility.log('App Initialized');
}

Future<void> _initPreAppServices() async {
  AppUtility.log('Initializing PreApp Services');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await StorageGetterSetters().init();
  await Hive.initFlutter();

  AppUtility.log('Registering Hive Adapters');

  AppUtility.log('Hive Adapters Registered');

  AppUtility.log('Opening Hive Boxes');

  await Hive.openBox<String>(HiveBoxNames.themeMode);

  AppUtility.log('Hive Boxes Opened');

  AppUtility.log('Initializing Get Services');

  Get.put(AppThemeController(), permanent: true);

  AppUtility.log('Get Services Initialized');

  AppUtility.log('Checking Token');

  AppUtility.log('Token Checked');

  await LocalDatabaseHelper.instance.openGalleonDatabase();

  AppUtility.log('Gallon Local Database Initialized');

  AppUtility.log('PreApp Services Initialized');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  Future<String> _handleAppInitialRoute() async {
    String? userId = await StorageDataHandler.getUserId() ?? '';
    String? login = DatabaseHelper.instance.firebaseAuth.currentUser?.uid ?? '';
    if (userId != '' && login != '') {
      return AppRoutes.home;
    } else {
      await StorageDataHandler.deleteAllData();
      return AppRoutes.login;
    }
  }

  ThemeMode _handleAppTheme(String mode) {
    if (mode == kDarkMode) {
      return ThemeMode.dark;
    }
    if (mode == kLightMode) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppThemeController>();
    return ScreenUtilInit(
      designSize: const Size(392, 744),
      builder: (ctx, child) {
        return FutureBuilder(
          future: _handleAppInitialRoute(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GlobalLoaderOverlay(
                child: GetMaterialApp(
                  title: StringValues.appName.tr,
                  debugShowCheckedModeBanner: false,
                  themeMode: _handleAppTheme(appController.themeMode),
                  theme: appController.getLightThemeData(context),
                  darkTheme: appController.getDarkThemeData(context),
                  getPages: AppPages.pages,
                  initialRoute: snapshot.data,
                  translations: AppTranslation(),
                  locale: Get.deviceLocale,
                  fallbackLocale: const Locale('en', 'IN'),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
