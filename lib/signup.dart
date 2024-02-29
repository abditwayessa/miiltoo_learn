import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miiltoo_learn/constants/color.dart';
import 'package:miiltoo_learn/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miiltoo_learn/screens/signup_otp.dart';
import 'package:miiltoo_learn/screens/signup_user.dart';
final _formKey = GlobalKey<FormState>();


void main() {
  runApp(const Signup());
}

final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailController = TextEditingController();
final phoneNumberController = TextEditingController();
var collRef = FirebaseFirestore.instance.collection('users');
class Signup extends StatelessWidget {


  const Signup({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title:   Row(
            children:[
             BackButton(
               style: ButtonStyle(

               ),
             ),
              Text(
                'New Account',
                style: TextStyle(
                  color: kTextColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          backgroundColor: kPrimaryAppColor,
        ),

        body:  const MyWidget(),
        backgroundColor: kBackgroundColor,

      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

var error_first_name = '';

@override
void dispose() {
  // firstNameController.dispose();
  // lastNameController.dispose();
  // phoneNumberController.dispose();
  // emailController.dispose();
  super.dispose();
}
  void _resetPage() {
    setState(() {
      _counter = 0;
    });
  }
void _resetForm() {
  _formKey.currentState!.reset();
  firstNameController.clear();
  lastNameController.clear();
  phoneNumberController.clear();
  emailController.clear();
}
Future<void> refreshData() async {
  await Future.delayed(const Duration(seconds: 2));
  setState(() {
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
});
      }

@override
  Widget build(BuildContext context) {

    return Container(
        child: RefreshIndicator(
          onRefresh: refreshData,
      child:Form(
        key: _formKey,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     // Expanded(
            //     //   child: Container(
            //     //     margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
            //     //     constraints: const BoxConstraints(),
            //     //     // child: TextFormField(
            //     //     //   // autovalidateMode: AutovalidateMode.onUserInteraction,
            //     //     //   controller: firstNameController,
            //     //     //   keyboardType: TextInputType.name,
            //     //     //   decoration: InputDecoration(
            //     //     //     hintText: 'First Name',
            //     //     //       labelText: 'First Name',
            //     //     //     border: OutlineInputBorder(
            //     //     //       borderRadius: BorderRadius.circular(20),
            //     //     //     ),
            //     //     //   ),
            //     //     //   validator: (value) {
            //     //     //     if (value!.isEmpty) {
            //     //     //       return 'Please enter first name!';
            //     //     //     } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            //     //     //       return 'Please enter only characters!';
            //     //     //     } else {
            //     //     //       return null;
            //     //     //     }
            //     //     //   },
            //     //     // ),
            //     //   ),
            //     // ),
            //     // Expanded(
            //     //   child: Container(
            //     //     margin: const EdgeInsets.fromLTRB(10, 0, 20, 20),
            //     //     constraints: const BoxConstraints(),
            //     //     // child: TextFormField(
            //     //     //   // autovalidateMode: AutovalidateMode.onUserInteraction,
            //     //     //   controller: lastNameController,
            //     //     //   keyboardType: TextInputType.name,
            //     //     //   decoration: InputDecoration(
            //     //     //     hintText: 'Last Name',
            //     //     //     labelText: 'Last Name',
            //     //     //     border: OutlineInputBorder(
            //     //     //       borderRadius: BorderRadius.circular(20),
            //     //     //     ),
            //     //     //   ),
            //     //     //   validator: (value) {
            //     //     //     if (value!.isEmpty) {
            //     //     //       return 'Please enter last name!';
            //     //     //     } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            //     //     //       return 'Please enter only characters!';
            //     //     //     } else {
            //     //     //       return null;
            //     //     //     }
            //     //     //   },
            //     //     // ),
            //     //
            //     //   ),
            //     // ),
            //   ],
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
              width: MediaQuery.of(context).size.width * 0.5,
              child:Image.asset(
                  'assets/icons/user.png',
                  fit: BoxFit.fill,
              ),
            ),
             Container(
               margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
             child: const Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
               Text(
                'Create new account and enjoy your \n e-learning with amazing  \n community',
                style: TextStyle(
                  color: kPrimaryAppColor,
                  fontSize: 23.7,
                  fontWeight: FontWeight.w700,

                ),
              ),
               ],
            ),),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              width: MediaQuery.of(context).size.width * 0.9,
              constraints: const BoxConstraints(),
              child: TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 13,
                keyboardType: TextInputType.phone,
                controller: phoneNumberController,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20)
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number!';
                  }else if(!RegExp(r'(\+251)?9\d{8}').hasMatch(value)){
                    return 'Please enter correct phone number!';
                  }else{
                    return null;
                  }
                },
                // onChanged: (value) => _validateInput(),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              width: MediaQuery.of(context).size.width * 0.9,
              constraints: const BoxConstraints(),
              // child: TextFormField(
              //   // autovalidateMode: AutovalidateMode.onUserInteraction,
              //   controller: emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //     labelText: 'Email',
              //     border: OutlineInputBorder(
              //         borderRadius:
              //         BorderRadius.circular(20)
              //     ),
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              //       return 'Please enter correct email!';
              //     }else {
              //       return null;
              //     }
              //   },
              //   // onChanged: (value) => _validateInput(),
              // ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Signup_OTP()),
                      );

                    }

                    },
                    style: TextButton.styleFrom(
                      foregroundColor: kPrimaryAppColor,
                      backgroundColor: kPrimaryAppColor,
                      //fixedSize:  Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.08,),
                    ),
                    child: const Text(
                        'Continue',
                        style: TextStyle(
                            color: kTextColorWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        )
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            //   width: MediaQuery.sizeOf(context).width * 0.9,
            //   height: MediaQuery.sizeOf(context).height * 0.06,
            //   child: OutlinedButton(
            //     onPressed: () {
            //       _resetPage();
            //       _resetForm();
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const MyApp()),
            //       );
            //     },
            //     style: OutlinedButton.styleFrom(
            //       side: const BorderSide(
            //         color: kPrimaryAppColor,
            //         width: 2.0,
            //       ),
            //
            //     ),
            //     child: const Text(
            //       'Log in',
            //       style: TextStyle(
            //         color: kTextColorBlack,
            //         fontSize: 18,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ),
            // ),
          ],

        ),
      ),
    ),
        ),
    );
  }
}
