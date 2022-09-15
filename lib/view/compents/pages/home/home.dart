

import 'package:flutter/material.dart';
import '../../../../utilis/components/app_color.dart';
import 'events.dart';
import 'final.dart';
import 'lectures.dart';
import 'midterm.dart';
import 'note.dart';
import 'sections.dart';
 


class Home extends StatefulWidget {
   
    Home({super.key});
     static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: _title,
      home: Home(),
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: News',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:Text("") ,
        title: Row(
          children: [
            Center(
                      child: Text("Orange ",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color:Color.fromARGB(255, 236, 106, 0)),)),
                             Text("Digital Center",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color: Colors.black),)

          ],
        ),
              
        actions: []),

      body:GridView.count(
  primary: false,
  padding: const EdgeInsets.all(10).copyWith(right: 30,left: 30,bottom: 0,top: 20),
  crossAxisSpacing: 20,
  mainAxisSpacing: 0,
  crossAxisCount: 2,
  children: <Widget>[
     



     Padding(
       padding: const EdgeInsets.all(0.0).copyWith(top: 10,bottom: 20),
       child: InkWell(
        onTap: (() => Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const lectures()))),
         child: Container(
         height: 10,
         width: 20,
                                    
         decoration: new BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
                                     
             blurRadius: 20.0,  
             spreadRadius: 0.0,  
             offset: Offset(400.0,  5.0,  ),
          )
         ],
          ),
           child: Card(
          
             elevation: 7,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          
            ),
            child: Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0).copyWith(top: 10),
                    child: Container(
                      width: 70,height: 70,
                      child: CircleAvatar(backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 17),
                    child: Icon(Icons.menu_book_outlined,color: appcolors ,size: 50,shadows: [
                         /////////////////////////////////////////////
                    ],),
                  )
                ],
              ),SizedBox(height: 10,),
              Text("Lectures",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color:appcolors),)
            ],),
           ),
         ),
       ),


     ), Padding(
       padding: const EdgeInsets.all(0.0).copyWith(top: 10,bottom: 20),
       child: InkWell(
        onTap: (() =>  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  Sections()))),
         
         child: Container(
         height: 10,
         width: 20,
                                    
         decoration: new BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
                                     
             blurRadius: 20.0,  
             spreadRadius: 0.0,  
             offset: Offset(400.0,  5.0,  ),
          )
         ],
          ),
           child: Card(
          
             elevation: 7,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          
            ),
            child: Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0).copyWith(top: 10),
                    child: Container(
                      width: 70,height: 70,
                      child: CircleAvatar(backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 17),
                    child: Icon(Icons.people_alt_rounded,color:appcolors ,size: 50,shadows: [
                         /////////////////////////////////////////////
                    ],),
                  )
                ],
              ),SizedBox(height: 10,),
              Text("Sections",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color:appcolors),)
            ],),
           ),
         ),
       ),
     ), Padding(
       padding: const EdgeInsets.all(0.0).copyWith(top: 10,bottom: 20),
       child: InkWell(
        onTap: () =>  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  MidTerm())),
         
         child: Container(
         height: 10,
         width: 20,
                                    
         decoration: new BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
                                     
             blurRadius: 20.0,  
             spreadRadius: 0.0,  
             offset: Offset(400.0,  5.0,  ),
          )
         ],
          ),
           child: Card(
          
             elevation: 7,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          
            ),
            child: Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0).copyWith(top: 10),
                    child: Container(
                      width: 70,height: 70,
                      child: CircleAvatar(backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 17),
                    child: Icon(Icons.text_snippet_sharp,color:appcolors,size: 50,shadows: [
                         /////////////////////////////////////////////
                    ],),
                  )
                ],
              ),SizedBox(height: 10,),
              Text("Mideterms",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color:appcolors),)
            ],),
           ),
         ),
       ),
     ), Padding(
       padding: const EdgeInsets.all(0.0).copyWith(top: 10,bottom: 20),
       child: InkWell(
        onTap: () =>  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  Final())),
         child: Container(
         height: 10,
         width: 20,
                                    
         decoration: new BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
                                     
             blurRadius: 20.0,  
             spreadRadius: 0.0,  
             offset: Offset(400.0,  5.0,  ),
          )
         ],
          ),
           child: Card(
          
             elevation: 7,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          
            ),
            child: Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0).copyWith(top: 10),
                    child: Container(
                      width: 70,height: 70,
                      child: CircleAvatar(backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 17),
                    child: Icon(Icons.view_timeline_outlined,color:appcolors ,size: 50,shadows: [
                         /////////////////////////////////////////////
                    ],),
                  )
                ],
              ),SizedBox(height: 10,),
              Text("Finals",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color:appcolors),)
            ],),
           ),
         ),
       ),
     ), Padding(
       padding: const EdgeInsets.all(0.0).copyWith(top: 10,bottom: 20),
       child: InkWell(
        onTap: () =>  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  EventsPage())),
         
         child: Container(
         height: 10,
         width: 20,
                                    
         decoration: new BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
                                     
             blurRadius: 20.0,  
             spreadRadius: 0.0,  
             offset: Offset(400.0,  5.0,  ),
          )
         ],
          ),
           child: Card(
          
             elevation: 7,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          
            ),
            child: Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0).copyWith(top: 10),
                    child: Container(
                      width: 70,height: 70,
                      child: CircleAvatar(backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 17),
                    child: Icon(Icons.calendar_month_sharp,color:appcolors ,size: 50,shadows: [
                         /////////////////////////////////////////////
                    ],),
                  )
                ],
              ),SizedBox(height: 10,),
              Text("Events",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color:appcolors),)
            ],),
           ),
         ),
       ),
     ), Padding(
       padding: const EdgeInsets.all(0.0).copyWith(top: 10,bottom: 20),
       child: InkWell(
        onTap: (() =>  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  Notes()))),
         
         child: Container(
         height: 10,
         width: 20,
                                    
         decoration: new BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
                                     
             blurRadius: 20.0,  
             spreadRadius: 0.0,  
             offset: Offset(400.0,  5.0,  ),
          )
         ],
          ),
           child: Card(
          
             elevation: 7,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          
            ),
            child: Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0).copyWith(top: 10),
                    child: Container(
                      width: 70,height: 70,
                      child: CircleAvatar(backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 17),
                    child: Icon(Icons.edit_note_outlined,color:appcolors ,size: 50,shadows: [
                         /////////////////////////////////////////////
                    ],),
                  )
                ],
              ),SizedBox(height: 10,),
              Text("Notes",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color:appcolors),)
            ],),
           ),
         ),
       ),
     ),
     
    
  ],
  
),
// bottomNavigationBar:  GNav(
//               rippleColor: Color.fromARGB(126, 255, 102, 0),
//               hoverColor: Color.fromARGB(126, 255, 102, 0),
//               gap: 10,
//               activeColor: appcolors,
//               iconSize: 29,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               duration: Duration(milliseconds: 400),
//               tabBackgroundColor: Color.fromARGB(21, 255, 102, 0),
//               color: Color.fromARGB(197, 255, 102, 0),
//               tabs: [
//                 GButton(
//                   icon: Icons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: Icons.newspaper_sharp,
//                   text: 'Likes',
//                 ),
//                 GButton(
//                   icon: Icons.settings,
//                   text: 'Search',
//                 ),
                 
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),


  
    );
  }
}