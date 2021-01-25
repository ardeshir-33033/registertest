import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/pasajtabaghewidget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'EnterScreen/LoginPage.dart';
import 'Provider/ProviderServices.dart';

void main() {
  runApp(MyApp());
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
      theme: ThemeData(
        fontFamily: 'IRANSans',
        brightness: Brightness.light,
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
      home: MultiProvider(providers: [
        ChangeNotifierProvider<AutoLoginCheck>(
          create: (context) => AutoLoginCheck(),
        )
      ], child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return QC_LoginPage();
  }
}
