// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gopage_pos/bloc/order_bloc/order_bloc.dart';
import 'package:gopage_pos/bloc/order_bloc/order_state.dart';
import 'package:gopage_pos/screens/login_screen/login_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/login_bloc/login_bloc_bloc.dart';
import 'bloc/login_bloc/login_bloc_state.dart';
import 'plugins/app_language.dart';

import 'dart:async';

import 'plugins/app_localizations.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/splash/splash_screen.dart';
import 'style/style.dart';

import 'package:provider/provider.dart';

import 'utils/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  // await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBlocBloc>(
      create: (context) => LoginBlocBloc(LoginBlocState.initial()),
    ),
    BlocProvider<POSOrderBloc>(
      create: (_) => POSOrderBloc(POSOrderState.initial()),
    )
    //add more bloc here
  ], child: MyApp(appLanguage: appLanguage)));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.appLanguage}) : super(key: key);
  final AppLanguage appLanguage;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // static const platform = MethodChannel(methodChannel);
  // final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    // _messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Hive.initFlutter();
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   debugPrint('Got a message whilst in the foreground!');
    //   debugPrint('Message data: ${message.data}');

    //   if (message.notification != null) {
    //     debugPrint(
    //         'Message also contained a notification: ${message.notification}');
    //   }
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   debugPrint('Got a message whilst in the background!');
    //   debugPrint(
    //       'Message also contained a notification: ${message.notification}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
        create: (_) => widget.appLanguage,
        lazy: true,
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return MaterialApp(
              // builder: (BuildContext? context, Widget? child) {
              //   final data = MediaQuery.of(context!);
              //   return MediaQuery(
              //       data: data.copyWith(textScaleFactor: 1),
              //       child: child ?? Container());
              // },
              builder: EasyLoading.init(),
              color: white,
              debugShowCheckedModeBanner: false,
              supportedLocales: const [
                Locale('vi', 'VN'),
                Locale('en', 'US'),
              ],
              locale: model.appLocal,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback:
                  (locale, Iterable<Locale> supportedLocales) {
                if (locale == null) {
                  return supportedLocales.first;
                }
                for (Locale supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode ||
                      supportedLocale.countryCode == locale.countryCode) {
                    // debugPrint("*language ok $supportedLocale");
                    return supportedLocale;
                  }
                }

                return supportedLocales.first;
              },
              title: 'Go Call',
              theme: ThemeData(primaryColor: blueBrand
                  // primarySwatch: Colors.white,
                  ),
              initialRoute: Routers.splash,
              routes: <String, WidgetBuilder>{
                Routers.splash: (_) => const SplashScreen(),
                Routers.login: (_) => const LoginScreen(),
                Routers.dashboard: (_) => const DashboardScreen()
              });
        }));
  }
}
