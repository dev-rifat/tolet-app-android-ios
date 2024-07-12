import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main/home/view/widget/card_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: _logoLayout(),
    );
  }
  _logoLayout() {
    return    Center(
      child: SizedBox(
        height: 130,
        width: 160,
        child: Card(
          color: Colors.white,
          shape: roundedRectangleBorder,
          elevation: 0,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.home,size: 40,),
              Text("To-let",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w900),),
            ],
          ),
        ),
      ),
    );
  }
}

