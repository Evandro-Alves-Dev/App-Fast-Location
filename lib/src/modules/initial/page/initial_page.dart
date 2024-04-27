import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/src/modules/page/home_page.dart';

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
    
    //TODO: Verificar o tempo de loading se esta adequado

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomePage(title: "Fast Location"),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
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
