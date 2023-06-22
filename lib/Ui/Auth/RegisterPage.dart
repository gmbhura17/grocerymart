import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/StyleResources.dart';
import '../../utils/constants.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextFormField.dart';
import 'LoginPage.dart';
import 'authStack.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  final fullName = GlobalKey<FormFieldState>();
  final phone = GlobalKey<FormFieldState>();
  final email = GlobalKey<FormFieldState>();
  final passkey = GlobalKey<FormFieldState>();

  TextEditingController  fullNameCn = TextEditingController();
  TextEditingController  phoneCn = TextEditingController();
  TextEditingController  emailCn = TextEditingController();
  TextEditingController passCn = TextEditingController();
  bool? obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  authStack(context),
                  TextButton(
                    onPressed: null,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('img/gro_create.png',width: 30.w),
                        Positioned(
                            left: 2.5.w,
                            right: 5.w,
                            bottom: 4.5.h,
                            child:  Center(
                              child: Text('<',style:  TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 30,
                              ),),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 6.h,),
                      Expanded(
                          child: MyTextFormField(
                            myController: fullNameCn,
                            myTextInputType: TextInputType.text,
                            myHintText: 'Full Name',
                            key: fullName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              fullName.currentState!.validate();
                            },
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(height: 6.h,),
                      Expanded(
                        child: MyTextFormField(
                          myController: phoneCn,
                          key: phone,
                          myHintText: 'Phone',
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            if (value.length < 10) {
                              return 'please enter valid phone number';
                            }
                            //  else if (!Constants.regPhone.hasMatch(value)) {
                            //   return "Please enter a valid phone number";
                            // }
                            return null;
                          },
                          onChanged: (value) {
                            phone.currentState!.validate();
                          },
                          maxLength: 10,
                          myTextInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  MyTextFormField(
                    myController: emailCn,
                    myTextInputType: TextInputType.emailAddress,
                    myHintText: 'Email',
                    textFieldKey: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!Constants.regEmail.hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    onChanged : (value) {
                      setState(() {
                        email.currentState!.validate();
                      });
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(height: 8.h,),
                      Expanded(
                        child: MyTextFormField(
                          myController: passCn,
                          myTextInputType: TextInputType.visiblePassword,
                          myHintText: 'Password',
                          textFieldKey: passkey,
                          obSecureText: obscureText,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            if (value.length < 8) {
                              return 'Must be more than 8 character';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            passkey.currentState!.validate();
                          },
                          myIcon: IconButton(
                              onPressed: () {
                                _toggle();
                              },
                              icon: (obscureText! ? Icon(Icons.visibility,color: Theme.of(context).primaryColorDark,): Icon(Icons.visibility_off,color: Theme.of(context).primaryColorDark))
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.h),
                  MyPrimaryButton(
                    onClick: (){
                      _formKey.currentState!.validate();
                    },
                    btnText: "Create",
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an account?",style: Theme.of(context).textTheme.bodyText2,),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                          child: Text("Login",style: TextStyle(color: Theme.of(context).primaryColorDark),)
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}