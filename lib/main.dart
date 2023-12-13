import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hadayaapp/pushnotifacation.dart';
import 'package:hadayaapp/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future _firebaseBackgroundMessage(RemoteMessage message)async{
  if(message.notification!=null){
    print("some notifiacation");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);

  PushNotifications.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFCC2131),

  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SafeArea(child: SplashScreen()) ,
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: const Color(0xFFCC2131),
      ),

    );
  }
}

