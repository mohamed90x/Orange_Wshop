 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../model/home_model/deafultTextfield.dart';
import '../../../model/loading.dart';
 
import '../../../utilis/components/app_color.dart';
import '../../../view_model/signup/sign_cubit.dart';
 
import '../getsizebox.dart';
import 'Signin.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
GlobalKey<FormState> registerFormKey = GlobalKey();
  static List<String> genderList = ["Male", "Female",];

  var genderDropdownValue = genderList.first;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: "Orange",
            style: TextStyle(
                color: appcolors, fontSize: 30, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: ' Digital Center ',
                  style: TextStyle(fontSize: 30,
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          print(state);
          if (state is RegisterSuccessful) {
            Fluttertoast.showToast(msg: "Registered Successfully.");
            Navigator.pop(context);
          } else if (state is RegisterError) {
            Fluttertoast.showToast(msg: "Connection Error.");
          }
          else if (state is RegisterValidationError) {
            Fluttertoast.showToast(msg: "Email is Already registered.");
          }  
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return (state is GettingData || state is RegisterInitial)
              ? loading(context)
              : MediaQuery(
                  data: const MediaQueryData(),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width / 20,
                        MediaQuery.of(context).size.height / 20,
                        MediaQuery.of(context).size.width / 20,
                        MediaQuery.of(context).size.height / 40),
                    child: SingleChildScrollView(
                      child: Form(
                        key: registerFormKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 30,
                                  left: MediaQuery.of(context).size.width / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 100),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('Sign Up',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30)),
                              ),
                            ),
                            getSizedBox(context),
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.text,
                              label: "Name",
                              isPassword: false,
                            ),
                            getSizedBox(context),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: "E-mail",
                              isPassword: false,
                            ),
                            getSizedBox(context),

                            defaultFormField(
                                controller: passwordController,
                                type: TextInputType.text,
                                label: "Password",
                                isPassword: true,
                                suffixIcon: Icons.remove_red_eye_sharp,
                                 
                                
                                ),
                                
                            getSizedBox(context),

                            defaultFormField(
                                controller: passwordConfirmationController,
                                type: TextInputType.text,
                                label: "Password",
                                isPassword: true,
                                suffixIcon: Icons.remove_red_eye_sharp),
                            getSizedBox(context),

                            defaultFormField(
                              controller: phoneNumberController,
                              type: TextInputType.phone,
                              label: "Phone Number",
                              isPassword: false,
                            ),
                            getSizedBox(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Gender",style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height:MediaQuery.of(context).size.height /100,
                                    ),
                                    Container(
                                      height:MediaQuery.of(context).size.height /20,
                                      width:MediaQuery.of(context).size.height /10,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular( 10)),
                                          border: Border.all(color: appcolors)),
                                      child: DropdownButton<String>(
                                        underline: SizedBox(),
                                        hint: Text("Gender"),
                                        alignment: Alignment.center,
                                        value: registerCubit.genderDropDownItem,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onChanged: (String? value) {
                                          registerCubit.setgenderDropdown(value);
                                        },
                                        items: genderList.map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                textAlign: TextAlign.center),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "University",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height:MediaQuery.of(context).size.height /100,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MediaQuery.of(context).size.width /40)),
                                          border: Border.all(color: appcolors)),
                                      child: DropdownButton<String>(
                                        underline: SizedBox(),
                                        alignment: Alignment.center,
                                        hint: Text("University "),
                                        isExpanded: true,
                                        value: registerCubit
                                            .universityDropDownItem,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 16,
                                        style: const TextStyle(color: appcolors),
                                        onChanged: (String? value) {
                                          registerCubit.setUniversityDropdown(value);
                                        },
                                        items: registerCubit.universityList.map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: SizedBox(
                                                child: Text(value,
                                                    textAlign:
                                                        TextAlign.center)),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            getSizedBox(context),
                            Column(
                              children: [
                                const Text(
                                  "Grade",
                                  style: TextStyle(fontSize: 18),),
                                SizedBox(
                                  height:MediaQuery.of(context).size.height / 100,
                                ),
                                Container(
                                  height:MediaQuery.of(context).size.height / 20,
                                  width: MediaQuery.of(context).size.height / 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(color: appcolors)),
                                  child: DropdownButton<String>(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    hint: Text("Grade"),
                                    alignment: Alignment.center,
                                    // value: gradeList.first,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: const TextStyle(color: appcolors),
                                    onChanged: (String? value) {
                                      registerCubit.setGradeDropdown(value);
                                    },
                                    value: registerCubit.gradeDropDownItem,
                                    items: registerCubit.gradeList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        onTap: () {
                                          registerCubit.gradeDropDownItem =
                                              value;
                                        },
                                        child: SizedBox(
                                            child: Text(value,
                                                textAlign: TextAlign.center)),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            (state is RegisterLoading)
                                ? LoadingAnimationWidget.horizontalRotatingDots(
                                  color: appcolors,

                                   size: 
                                        MediaQuery.of(context).size.width / 17)
                                : ClipRRect(
                                   borderRadius: BorderRadius.circular(10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      40)),
                                          primary: appcolors,
                                          fixedSize: Size(
                                              MediaQuery.of(context).size.width /
                                                  1.1,
                                              MediaQuery.of(context).size.height /
                                                  16),
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      onPressed: () {
                                        if (passwordController.text != passwordConfirmationController.text) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Make Sure passwords are indentical.");
                                        } else if (registerFormKey.currentState!
                                            .validate()) {
                                          try {
                                            registerCubit.register(
                                              emailController.text,
                                              passwordController.text,
                                              nameController.text,
                                              'm',
                                              phoneNumberController.text,
                                              2,
                                              3
                                            );
                                          } catch (error) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Email is already registered.");
                                            registerCubit.submitFail();
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "wrong ");
                                        }
                                      },
                                      child: Text("Sign Up"),
                                    ),
                                ),
                            Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(left: 10,right: 15,top: 10,bottom: 20),
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
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: appcolors, width: 2)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: appcolors,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Login"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}