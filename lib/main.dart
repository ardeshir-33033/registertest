import 'package:flutter/material.dart';
import 'package:register/pasajtabaghewidget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'EnterScreen/LoginPage.dart';

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
           
      bodyText1: TextStyle(color: Colors.black87,fontFamily: 'IRANSans'),

      ),
      
       ),
       
        
      
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      
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













// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class Animatedred extends StatefulWidget {
//   @override
//   _AnimatedredState createState() => _AnimatedredState();
// }

// class _AnimatedredState extends State<Animatedred> {
//   List<String> types = ['تعمیرگاه', 'چراغ برق', 'اطراف تهران', 'شهرستان'];
//   String selectTypes = 'تهران';
//   Decoration userSelected = BoxDecoration(
//     shape: BoxShape.rectangle,
   
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.0,
//       width: 800,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: types
//               .map((e) => Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                     InkWell(
//                       onTap: () {
//                         selectTypes = e;
//                         setState(() {});
//                       },
//                       child: Text(e),
//                     ),
//                     Container(
//                       height: 3,
//                       width: 50,
//                       color: Colors.red,
//                       decoration:
//                           selectTypes == e ? userSelected : BoxDecoration(),

//                     )
//                   ]))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
