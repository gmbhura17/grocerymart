import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Widgets/MyTextFormField.dart';
import '../../resources/StyleResources.dart';
import '../../utils/constants.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../Pages/HomeScreen.dart';
import 'AuthStack.dart';
import 'ForgotPassword.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final email = GlobalKey<FormFieldState>();
  final passkey = GlobalKey<FormFieldState>();

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
              authStack(context),
              Column(
                children: [
                  SizedBox(height: 3.h),
                  Text('Login',style: Theme.of(context).textTheme.bodyText1),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ForgotPassword()));
                          },child: Text('Forgot Password?',style: TextStyle(fontSize: 14,color: StyleResources.errorColor)
                      )
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  MyPrimaryButton(
                    onClick: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeScreen()));
                      }
                    },
                    btnText: "Login",
                  ),
                  SizedBox(height: 2.h),
                  const Text('Or Continue With',style: TextStyle(fontSize: 10,),),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('img/gro_fb.png',width: 40,),
                      Image.asset('img/gro_google.png',width: 40,),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account yet ?",style: Theme.of(context).textTheme.bodyText2,),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RegisterPage()));
                          },
                          child: Text("Create",style: TextStyle(color: Theme.of(context).primaryColorDark),)
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