import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
 
import '../../../../utilis/components/app_color.dart';
import 'home.dart';
import 'navigation.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});
  

  @override
  State<EventsPage> createState() => _EventsState();
}

class _EventsState extends State<EventsPage> {
  
  @override
  Widget build(BuildContext context) {
     

    return CalendarControllerProvider(
      
    controller: EventController(),
    child: Scaffold(
        appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: appcolors ,size: 26,),
                
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
                     Text("Events",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600,color: Colors.black),)
                  ],),
                ),
                 
              ),
                ),
        body: Theme(

          data: ThemeData(primarySwatch: Colors.red, splashColor: Colors.green),
          child: MonthView(

              
             
            
          
          ),
        ),
    ),
);
  }
}