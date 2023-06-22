import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/constants.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextFormField.dart';
import '../Pages/HomeScreen.dart';
import 'LoginPage.dart';
import 'authStack.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  final email = GlobalKey<FormFieldState>();
  TextEditingController  emailCn = TextEditingController();


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
                  Text('Reset Your Password',style: Theme.of(context).textTheme.bodyText1),
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
                  SizedBox(height: 5.h),
                  MyPrimaryButton(
                    onClick: (){
                      if(_formKey.currentState!.validate())
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeScreen()));
                      }
                    },
                    btnText: "Submit",
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginPage()));
                          },
                          child: const Text("Cancel",style: TextStyle(color: Color(0xFF131212),decoration: TextDecoration.underline,))
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