import 'package:flutter/material.dart';
import 'package:orangetest/view/compents/pages/settings/settings.dart';
import '../../../../utilis/components/app_color.dart';

class Partners extends StatelessWidget {
  const Partners({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black ,size: 26,),
                
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  Settings()));
                },),
                title:  Padding(
                padding: const EdgeInsets.all(30.0).copyWith(bottom: 30,right: 80),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                     Text(" Our Partners",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600,color: Colors.black),)
                  ],),
                ),
                 
              ),
                ),
                body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
          child: Container(
            height: 270,
            width: 370,
             decoration: BoxDecoration(
              color: Color.fromARGB(198, 189, 189, 189) ,
              boxShadow: [
                
              ]
              ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("ODC",style:TextStyle(color:  Color.fromARGB(184, 255, 255, 255), fontSize: 27,
                      fontWeight: FontWeight.w500
                       
                  )),
                     
                  ],),
                ),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   
                  children: [
                     

                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        
                         Text("Orange",style: TextStyle(fontSize: 32,color:appcolors,fontWeight: FontWeight.w800,shadows:[ Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 15.0,
        color: Color.fromARGB(255, 255, 255, 255),
      ),] ),),
                         Text(" Digital Center",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,shadows: [Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 15.0,
        color: Color.fromARGB(255, 255, 255, 255),
      ),] ),),]),
                        
                    ],),
                    
                    
                     
                  ],
                ),
                
              
               
              
            ),
            ),
        ),
      

    );
  }
}