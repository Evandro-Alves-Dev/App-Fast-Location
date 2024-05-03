import 'dart:async';


import 'package:fast_location/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenInitial extends StatefulWidget {
  const ScreenInitial({super.key});

  @override
  State<ScreenInitial> createState() => _ScreenInitialState();
}

class _ScreenInitialState extends State<ScreenInitial> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);  
  }

    void redirect(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed(AppRouter.home);
    });
  }  

  @override
  Widget build(BuildContext context) {
    redirect(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 90, 5, 236), Color.fromARGB(255, 174, 208, 221)],
          ),
        ),     
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.location_on_outlined, size: 150, color: Colors.black),
            CircularProgressIndicator(color: Colors.white),
            SizedBox(
              height: 60,
            ),
            Text(
              "Loading...",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
      ),
    ));
  }
}
