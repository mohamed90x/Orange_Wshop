
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangetest/view/compents/pages/settings/faq/faq_cubit.dart';
import 'package:orangetest/view/compents/pages/splash_screen.dart';
import 'package:orangetest/view_model/block_observer/block_observer.dart';
import 'package:orangetest/view_model/signin/signin_cubit.dart';
import 'view_model/addnote/addnote_cubit.dart';
import 'view_model/network/dio_helper.dart';
import 'view_model/notes/note_cubit.dart';
import 'view_model/signup/sign_cubit.dart';
 

 Future<void> main() async {
    
  await DioHelper.init();
    Bloc.observer= MyBlocObserver();
  runApp(const MyApp());
}

 class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
 
         BlocProvider(
          create: (context) =>SignCubit ()
          
          ),
          BlocProvider(create: (context) => RegisterCubit()..getData()),
         BlocProvider(create: (context) => NotesCubit()..getNotes()),
         BlocProvider(create: (context) => FaqCubit()..getFaQs()),
        BlocProvider(create: (context) => AddNoteCubit()..getTime()),
         
         ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(body: Splash()  
         ), 
      ),
    );
  }
  } 
   















 /* Scaffold(appBar: AppBar(
          leading: InkWell(
            onTap: (){
              setState(() {
                count++;
              });
            },
            child: Icon(Icons.access_alarm_rounded),),
        
    ),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: ListView.separated(itemBuilder: (context,index)=>ClipRRect(
      borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.access_alarm),
              ),
              Text("$index ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
          )],
          ),),
      ),separatorBuilder: (context, index) => SizedBox(height: 10,),itemCount: count,),
    ),
    )
 * 
 * 
 */