import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
 
import '../../../../utilis/components/app_color.dart';
import '../../../../view_model/sections/sections_cubit.dart';
import 'navigation.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
     
    return BlocProvider(
      create: (context) => SectionsCubit()..getData(),
      child: BlocConsumer<SectionsCubit, SectionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          SectionsCubit myCubit = SectionsCubit.get(context);
          return  
             Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: appcolors,size: 26,),
                
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  NavigationPage()));
                },),
                actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_alt,color: appcolors,size: 40, )),
                    )
                ],
                title: Center(
                  child: Text("Sections",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color: Colors.black),)),
              ),
              body: myCubit.isLoading == true
                  ? Center(child: Center(
                    
        child: LoadingAnimationWidget.horizontalRotatingDots(
           color: appcolors,

          size: 100,
        ),
      ),)
                  : Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ListView.separated(
                        itemCount: myCubit.data!.data!.length,
                        separatorBuilder: (context, index) => SizedBox(height: 0,),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0).copyWith(bottom: 0),
                            child: Container(
                               height: 130,
                                
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
                                   
                                
                                
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(myCubit.data!.data![index].sectionSubject
                                              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.access_time),
                                              Text(" 2hrs",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                     SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(0.0).copyWith(right: 22),
                                              child: Text("Lecture Day",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.grey[400])),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_month_sharp,color: Colors.grey[700],),
                                                Text(myCubit
                                            .data!.data![index].sectionDate
                                            .toString()  ,style:  TextStyle(fontSize: 13,fontWeight: FontWeight.w900),),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(0.0).copyWith(right: 17),
                                              child: Text("Start Time",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.grey[400]),),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.watch_later_sharp,color: Color.fromARGB(193, 40, 183, 45)),
                                                Text(myCubit
                                            .data!.data![index].sectionStartTime
                                            .toString(),style:TextStyle(fontSize: 13,fontWeight: FontWeight.w900),),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(0.0).copyWith(right: 20),
                                              child: Text("End Time",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.grey[400])),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.watch_later_sharp,color: Color.fromARGB(206, 220, 90, 90)),
                                                Text( myCubit
                                            .data!.data![index].sectionEndTime
                                            .toString(),style:  TextStyle(fontSize: 13,fontWeight: FontWeight.w900),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            );
           
        },
      ),
    );
          
  }
  }
 