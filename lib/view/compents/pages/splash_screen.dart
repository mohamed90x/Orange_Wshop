import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Signin.dart';
 

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                         Text("Orange",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 236, 106, 0),fontWeight: FontWeight.w800),),
                         Text(" Digital Center",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w800),)
                       ],),
                       SizedBox(height: 30,),
                       Container(
                         width: 350,
                         child: new LinearPercentIndicator(
                          animation: true,
                         animationDuration:  3350,
                      percent: 1,
                  
                      progressColor: Color.fromARGB(255, 236, 106, 0),
                    ),
                       )
                       
            ],
          ) ,
        )
       ) ,
      nextScreen: Signin(),);
  }
}