import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../utilis/components/app_color.dart';
import '../../../../view_model/News/news_cubit.dart';
import 'navigation.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit()..getData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit myCubit = NewsCubit.get(context);
          return  Scaffold(
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
                  child: Text("News",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color: Colors.black),)),
              ),
        
      body: myCubit.isLoading == true
                  ? Center(child: Center(
                    
        child: LoadingAnimationWidget.horizontalRotatingDots(
           color: appcolors,

          size: 100,
        ),
      ),)
                  :ListView.separated(
        
        itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(18.0),
        
        child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
          child: Container(
            
            height: 300,
            width: 100,
             decoration: BoxDecoration(
                image:  DecorationImage(image: NetworkImage("${myCubit.data!.data[index].imageUrl}"),fit: BoxFit.cover,),
                
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
                    Text("${myCubit.data!.data[index].title}",style:TextStyle(color:  Color.fromARGB(223, 255, 255, 255), fontSize: 30,
                      fontWeight: FontWeight.w600
                       
                  )),
                    Container(
                      decoration: BoxDecoration(
                        color:appcolors,
                        borderRadius: BorderRadius.circular(10)
                        ),
                      width: 100,
                      height: 48,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.share_outlined,color: Color.fromARGB(213, 255, 255, 255),),
                          
                        ),
                         Padding(
                           padding: const EdgeInsets.all(0.0).copyWith(top:10,bottom: 10),
                           child: VerticalDivider(width: 10,thickness: 1,color:Color.fromARGB(119, 255, 255, 255),),
                         ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.dock_sharp,color: Color.fromARGB(209, 255, 255, 255),),
                        ),
                        

                      ],) ,
                    )
                    
                  ],),
                ),
                
                 SizedBox(height: 80,),
                
                Padding(
                  padding: const EdgeInsets.all(0.0).copyWith(left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                        Text("${myCubit.data!.data[index].body}",style:TextStyle(color:  Color.fromARGB(223, 255, 255, 255), fontSize: 25,
                        fontWeight: FontWeight.w600
                         
                    ))
                      ],
                      ),
                ),
                
              ],
              
            ),
            ),
            
        ),
      ),separatorBuilder: (context, index) => SizedBox(height: 10,),itemCount: myCubit.data!.data.length
      ),
    


    );
              
           
        },
      ),
    );
  }
}










 