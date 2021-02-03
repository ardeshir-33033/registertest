import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:register/MainPageScreen/AddBrand.dart';
import 'package:register/MainPageScreen/PasajSecondPage.dart';
import 'file:///C:/flutter/register/RegisterPT2/V2/lib/MainPageScreen/PasajNew.dart';
import 'package:register/pasajtabaghewidget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'EnterScreen/LoginPage.dart';
import 'Provider/PasajFirstProvider.dart';
import 'Provider/ProviderServices.dart';
import 'TextfieldProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider<TextFieldProvider>(
    //     create: (context) => TextFieldProvider()),
    // ChangeNotifierProvider<SizeProvider>(
    //     create: (context) => SizeProvider()),
    // ChangeNotifierProvider<FontSizeProvider>(
    //     create: (context) => FontSizeProvider()),
    // ChangeNotifierProvider<ContainerSizeProvider>(
    //     create: (context) => ContainerSizeProvider()),
    // ChangeNotifierProvider<ContainerProvider>(
    //     create: (context) => ContainerProvider()),
    ChangeNotifierProvider<TextFieldVisibleProvider>(
        create: (context) => TextFieldVisibleProvider()),
    ChangeNotifierProvider<TextFieldOpacityProvider>(
        create: (context) => TextFieldOpacityProvider()),
    ChangeNotifierProvider<AutoLoginCheck>(
      create: (context) => AutoLoginCheck(),
    ),
    ChangeNotifierProvider<PlaceCheckBoxProvider>(
      create: (context) => PlaceCheckBoxProvider(),
    ),
    ChangeNotifierProvider<checkBoxGuarantee>(
        create: (context) => checkBoxGuarantee())
  ], child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Colors.black));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      title: 'Flutter Demo',
      theme:
          // ThemeData.dark(),
          ThemeData(
        fontFamily: 'IRANSans',
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[50],
        primaryColorBrightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.grey.shade500,
        accentColorBrightness: Brightness.light,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black87, fontFamily: 'IRANSans'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => QC_LoginPage(),
        '/AddBrandPage': (context) => AddBrandpage(),
        '/PasajSecondPage': (context) => PasajSecondPage(),
      },
    );
  }
}
