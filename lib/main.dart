import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:clinica/controllers/product_controller.dart';
import 'package:clinica/splashscreen.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';

import 'tools/CustomTheme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
// await Firebase.initializeApp().then((value) => Get.put(ProductController()));
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      themeMode: ProductController().getThemeMode(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      locale: new Locale(ProductController().getlanguage()),
      ///////////languages ////////
      supportedLocales: [const Locale('en', 'EN'), const Locale('ar', 'EG')],

      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      /////////////
  //    home: ProductController().get_full_name()=='' ?Login():Home(),
     home: SplashScreen(),

    );
  }
}

