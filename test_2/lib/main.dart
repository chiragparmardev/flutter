import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_2/app_router.dart';
import 'package:test_2/route_setting.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // initialRoute: MyRouter.root,
      // onGenerateRoute: (settings) {
      //   return MyRouter.onGenerateRoute(settings);
      // },
      routerConfig: _appRouter.config(),
    );
  }
}
