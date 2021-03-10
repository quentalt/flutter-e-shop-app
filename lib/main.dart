import 'package:eshopappproject/pages/home.dart';
import 'package:flutter/material.dart';
import './pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade400,
      ),
      home: Login(),
  ));

}




