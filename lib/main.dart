import 'package:flutter/material.dart';
import 'views/beranda_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'db/bookmark_db.dart';
// import 'routes/route.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  await BookmarkDB().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BerandaView(),
    );
  }
}
