import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app/pages/main/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDqWdp7F40u8I9W_8nhsO1O6wV80o2m6S0",
          projectId: "gshoe-f83eb",
          messagingSenderId: "714198316325",
          appId: "1:714198316325:web:65a13810f5f3c7f659d6cc",
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
        initialRoute: "main",
        getPages: [
          GetPage(name: '/main', page: () => MainPage()),
        ]);
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: MainPage()
//       ),
//     );
//   }
// }
