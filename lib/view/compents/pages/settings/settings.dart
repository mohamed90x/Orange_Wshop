import 'package:flutter/material.dart';
import 'package:orangetest/view/compents/pages/Support.dart';
import 'package:orangetest/view/compents/pages/settings/faq/terms/Terms.dart';
import 'package:orangetest/view/compents/pages/Signin.dart';
import 'package:orangetest/view/compents/pages/settings/partners.dart';

import '../../../../utilis/components/app_color.dart';
import '../home/navigation.dart';
import 'faq/faq.dart';
import '../home/home.dart';
 

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black ,size: 26,),
                
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  NavigationPage()));
                },),
                title:  Padding(
                padding: const EdgeInsets.all(30.0).copyWith(bottom: 30,right: 80),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                     Text("Settings",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600,color: Colors.black),)
                  ],),
                ),
                 
              ),
                ),
     body: Column(
      children: [
         
            Column(
               
              children:[
                 InkWell(
                  onTap: () {
                     
                  },
                   child: InkWell(
                    onTap:(() =>  Navigator.push(context, MaterialPageRoute(builder: (context) => FaQ(),))),
                     child: Container(
                                    
                             height: 60,
                             width: 400,
                                decoration: BoxDecoration(color: Colors.white70),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(20.0),
                                   child: Text("FaQ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: 17),)
                                 ),
                                    
                               Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey[600],),
                                  
                             ],
                             ),
                             ),
                   ),
                 ),
           InkWell(
            onTap: (() =>  Navigator.push(context, MaterialPageRoute(builder: (context) => Terms(),))),
             child: Container(
                     height: 60,
                     width: 400,
               decoration: BoxDecoration(color: Colors.white70),
                     child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Terms& Condations",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: 17),)
                ),
           
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey[600],),
                 
                     ],
                     ),
                     ),
           ), InkWell
           (
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Partners(),));
            },
             child: Container(
                     height: 60,
                     width: 400,
               decoration: BoxDecoration(color: Colors.white70),
                     child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Our Partenrs",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: 17),)
                ),
           
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey[600],),
                 
                     ],
                     ),
                     ),
           ), InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Support(),));
            },

             child: Container(
                     height: 60,
                     width: 400,
               decoration: BoxDecoration(color: Colors.white70),
                     child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Support",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: 17),)
                ),
           
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey[600],),
                 
                     ],
                     ),
                     ),
           ), InkWell(
            onTap: (() => Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const Signin()))),
            child: Container(
            height: 60,
            width: 400,
               decoration: BoxDecoration(color: Colors.white70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Log out",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: 17),)
                ),
          
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey[600],),
                 
            ],
            ),
            ),
          ),
          ]
              ),
   
 
    ]),
    
      








       
       
     
    ) ;
  }
}
 