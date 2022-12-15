import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_crew_project/bottom_screens/bottom_navigation.dart';

import 'package:rare_crew_project/bottom_screens/home_screen.dart';
import 'package:rare_crew_project/screens/register_screen.dart';

class Keys {
static const key1 = Key('key1');
static const key2 = Key('key2');
}
class Login extends StatefulWidget {

  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {



  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = '';
  String userEmail = '';
  String userPass = '';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool obscureText = true;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        backgroundColor: Colors.black,
        body: SingleChildScrollView(


          child: Center(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),


              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Image.asset(
                      'assets/images/rare.png'),


                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Form(
                        key: formkey,
                        child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,


                              children: [
                                SizedBox(height: 100,),
                                Text('Login',style: GoogleFonts.lato(fontSize: 30.0,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),

                                SizedBox(height: 30,),

                                TextFormField(
                                  validator: (value)

                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'Please Enter The Right Info.';
                                    }
                                    return null ;
                                  },
                                  controller:emailController ,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 20.0,

                                  ),


                                  decoration: InputDecoration(

                                    labelText: 'Please Enter Your Email ',
                                    labelStyle: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                    ),

                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.orangeAccent,
                                      size: 30.0,
                                    ),

                                    border: const OutlineInputBorder(),
                                  ),
                                ),




                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(

                                  validator: (value)

                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'Please Enter The Right Info.';
                                    }
                                    return null;
                                  },
                                  obscureText: obscureText,
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,



                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),


                                  decoration: InputDecoration(

                                    labelText: 'Please Enter Your Password',
                                    labelStyle: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,

                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.orangeAccent,
                                      size: 30.0,
                                    ),
                                    suffixIcon:


                                    IconButton(

                                      icon: Icon(
                                        obscureText ? Icons.visibility_off : Icons.visibility,



                                      ),

                                      onPressed: () {
                                        setState(() {
                                        });
                                        obscureText = !obscureText;

                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),




                              ]
                          ),
                        ),


                      ),


                    ),
                  ),



                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: SizedBox(height: 50.0,
                          width: 300,
                          child: MaterialButton(


                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                SignIn(email: emailController.text.trim()
                                    .toString(),
                                    password: passwordController.text);
                              }

                              {


                              }
                            },

                            child: Text(
                              'Login',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.orangeAccent,
                                letterSpacing: 1.2,
                              ),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ! ',
                        style: GoogleFonts.lato(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed:() async {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:(context)=> Reg(),
                            ),
                          );
                        },

                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,


                          ),
                        ),
                      ),
                    ],
                  ),

                ],

              ),

            ),

          ),
        ),
      ),
    );
  }




  void SignIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Bottom()));
    } on FirebaseAuthException catch (e) {


      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'User Not Found',
            backgroundColor: Colors.grey,
            textColor: Colors.black,

            gravity: ToastGravity.CENTER);



      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Please Enter The Right Password ',
            backgroundColor: Colors.grey,
            textColor: Colors.black,
            gravity: ToastGravity.CENTER);
      }

      else if (e.code == '') {
        Fluttertoast.showToast(msg: 'Please Enter Right Info.',
            backgroundColor: Colors.grey,
            textColor: Colors.black,
            gravity: ToastGravity.SNACKBAR);
      }
    }
  }
}















