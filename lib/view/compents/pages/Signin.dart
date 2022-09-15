import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../utilis/components/app_color.dart';
import '../../../view_model/signin/signin_cubit.dart';
import 'SignUp.dart';
import 'home/navigation.dart';

 
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller =TextEditingController();
  final GlobalKey<FormState> valdi_Key =  GlobalKey();
  bool _obscuretext=true ;
class Signin extends StatefulWidget {
   
   const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {


    return  BlocProvider(

      create: (BuildContext context) => SignCubit(),
      child: BlocConsumer<SignCubit , SignInState>(
        listener: (context, Object? state) { 
          if(state is LoginSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => NavigationPage())));
          }
         },
        builder: (context, state) { 

           SignCubit myCubit = SignCubit.get(context);

          return Scaffold(
           body: SafeArea(
             child: SingleChildScrollView(
               child:  
                
                  Form(
                    key: valdi_Key,
                    child: Column(
                     children: [
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Row(children: [
                           Text("Orange",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 236, 106, 0),fontWeight: FontWeight.w800),),
                           Text(" Digital Center",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w800),)
                         ],)
                      ],),
                       
                    ),
                    SizedBox(height: 50,),
                    Container(
                     child:Column(children: [
                     Padding(
                       padding: const EdgeInsets.all(0.0).copyWith(left: 20),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                         ],
                       ),
                     ),
                     SizedBox(height: 20,),
                               ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                     child: Container(
                      width: 370,
                      height: 80,
                       child: TextFormField(
                        controller: emailcontroller,
                        validator: (
                          (value) {
                            if(value!.isNotEmpty ){return null;}
                                 else if(value.length >4 && value.isNotEmpty){
                                  return "your Email is invalid ";
                                 };
                                 } 
                          
                           ),
                        decoration: InputDecoration(
                          enabled: true,
                          hintText:  "E-mail",
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: 
                             Color.fromARGB(255, 236, 106, 0)
                             ,width: 2,
                             ),
                      
                          ),enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey,width: 2)
                            ),focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color.fromARGB(255, 236, 106, 0),width: 2)
                            ), 
                          
                  
                        ),
                        keyboardType: TextInputType.emailAddress,
                       ),
                     ),
                               ),   
                    
                               ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                     child: Container(
                      width: 370,
                      height: 60,
                       child: TextFormField(
                        controller: passcontroller,
                        obscureText: _obscuretext,
                        decoration: InputDecoration(
                          hintText:  "Passsword",
                          suffixIcon: GestureDetector(
                            onTap:(){
                              setState(() {
                                _obscuretext= !_obscuretext;
                              });
                            } ,
                            child: Icon(_obscuretext?Icons.visibility_off:Icons.visibility,color: Color.fromARGB(255, 236, 106, 0),)),
                         disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: 
                             Color.fromARGB(255, 236, 106, 0)
                             ,width: 2,
                             ),
                      
                          ),enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey,width: 2)
                            ),focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color.fromARGB(255, 236, 106, 0),width: 2)
                            ), 
                          
                        ),
                        keyboardType: TextInputType.visiblePassword,
                       ),
                     ),
                               ),
                               Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(0.0).copyWith(left: 20),
                         child: TextButton(onPressed: (){}, child: Text("Forgot Password?",style: 
                         TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(162, 236, 106, 0),
                          shadows:[
                            
                            Shadow(
                          offset: Offset(0, 7),
                          blurRadius: 10.0,
                          color: Color.fromARGB(53, 236, 106, 0),
                            )
                          ],
                          decoration: TextDecoration.underline),)),
                       ),
                     ],
                               ),SizedBox(height: 20,),
                               ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                     child: Container(
                      color: Colors.orange,
                      height: 50,
                      width: 370,
                      child:(state is LoginLoading) ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                    
        child: LoadingAnimationWidget.horizontalRotatingDots(
           color: appcolors,

          size: 40,
        ),
        
           ),
           SizedBox(width: 17,),
           Text("please Wait",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17),),
                        ],
                      ) :
                        ElevatedButton(onPressed: (){
                        myCubit.getData(emailcontroller.text , passcontroller.text);
                      }, child: Text("Login",style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                          , )
                          ),
                          style: ElevatedButton.styleFrom(primary:  Color.fromARGB(255, 236, 106, 0)) ,)),
                               ),SizedBox(height: 15,),
                              Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(left: 25,right: 25,top: 10,bottom: 20),
                    child: Row(
                      children: <Widget>[
                          Expanded(
                    child: Divider(height: 10,thickness: 1,color:Colors.grey,),
                  
                          ),       
                            SizedBox(width: 8,),
                          Text("OR",style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                            , )), 
                            SizedBox(width: 8,),       
                  
                          Expanded(
                    child:Divider(height: 10,thickness: 2,color:Colors.grey,),
                  
                          ),
                      ]
                  ),
                              ),
                     
                    ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                     child: Container(
                       decoration: BoxDecoration(
                        color: Colors.orange,
                         
                          
                       ),
                      height: 50,
                      width: 370,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>  Register()));
                      }, child: Text("Sign Up",style: TextStyle(color:  Color.fromARGB(246, 236, 109, 18), fontSize: 20,
                          fontWeight: FontWeight.w900
                           
                      ),),style: ElevatedButton.styleFrom(primary: Colors.white,side: BorderSide(width: 3.0, color: Color.fromARGB(172, 236, 106, 0),)),) ,)
                       
                            )
                      ] ),
                    
                               ),
                     ],),
                  )
                  )
                
        
               ),
             
           );
  }),
    );
  }
}