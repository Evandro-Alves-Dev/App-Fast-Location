import 'package:fast_location/src/modules/history/page/history_page.dart';
import 'package:fast_location/src/modules/home/components/input_screen.dart';
import 'package:fast_location/src/modules/home/components/search_empty.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:fast_location/src/modules/initial/page/initial_page.dart';
import 'package:fast_location/src/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Location',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScreenInitial(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRouter.home: (context) => const HomePage(title: "Fast Location"),
        AppRouter.history: (context) => const HistoryPage(),
        AppRouter.searchEmpty: (context) => const SearchEmpty(),
        // AppRouter.searchAddress: (context) => const SearchAddress(address: AddressModel(context.)),
        AppRouter.inputScreen: (context) => InputScreen(),
      },
    );
  }
}
