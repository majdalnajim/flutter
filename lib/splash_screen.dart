
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hadayaapp/webview_scrren.dart';

class SplashScreen extends StatefulWidget{
  const  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SafeArea(child: WebViewScreen())));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image:  AssetImage("images/splash_screen.png"),
                fit: BoxFit.fill,
              )
          )

      ),
    );
  }
}