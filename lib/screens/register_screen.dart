


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'login_screen.dart';

class Reg extends StatefulWidget{
  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  var emailController = TextEditingController();

  var usernameController =  TextEditingController();

  var passwordController =  TextEditingController();

  bool obscureText = true;

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
      ),


      body: Container(
        color: Colors.black,


          child: Form(
            key: Keys.key2,
            child: Container(

              color: Colors.black,



              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(





                            child: SingleChildScrollView(
                              child: Container(
                                
                                
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,


                                    children: [



                                      Image.asset('assets/images/splash.png'),
                                      SizedBox(height:120 ,),

                                      Text('Registration, Have a nice day !! ',style: GoogleFonts.lato(fontSize: 20.0,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),







                                      const SizedBox(
                                        height:100.0,
                                      ),
                                      TextFormField(
                                        validator: (value)

                                        {
                                          if(value!.isEmpty)
                                          {
                                            return 'Please Enter a Valid Data';
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

                                          labelText: 'Enter Your Email Address ',
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
                                        height: 50.0,
                                      ),
                                      TextFormField(

                                        validator: (value)

                                        {
                                          if(value!.isEmpty)
                                          {
                                            return 'Please Enter a Valid Data';
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

                                          labelText: 'Please Enter A Password ',
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


                                      const SizedBox(
                                        height: 20.0,
                                      ),


                                      Center(
                                        child: Container(
                                          decoration:BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(20),
                                          ) ,
                                          width:300 ,
                                          height: 50.0,



                                          child: MaterialButton(




                                            onPressed: ()  async {

                                              VerifyEmail();
                                              SignUp(email: emailController.text.trim(), password: passwordController.text);




                                            },




                                            child:Text(
                                              'Register',
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22.0,
                                                color: Colors.orangeAccent,
                                                letterSpacing: 1.2,
                                              ),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          )
                      )
                  ),
          ),
        ),
      );

  }

void VerifyEmail() async {

    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();

}

  void SignUp  ({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:email ,
          password: password);

      Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));
    }

    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        Fluttertoast.showToast(msg: 'Please Enter a correct password',fontSize: 15,backgroundColor: Colors.grey,textColor: Colors.black, gravity: ToastGravity.CENTER);
      }

      else if (e.code == 'email-already-in-use') {

        Fluttertoast.showToast(msg: 'This email already in use',fontSize: 15,backgroundColor: Colors.grey,textColor: Colors.black, gravity: ToastGravity.CENTER);
      }


      Fluttertoast.showToast(msg: 'Please Enter a Valid Data',fontSize: 15,backgroundColor: Colors.grey,textColor: Colors.black, gravity: ToastGravity.CENTER);

    } catch (error) {
      Fluttertoast.showToast(msg: 'Please Enter a Valid Data',fontSize: 10,backgroundColor: Colors.grey,textColor: Colors.black,gravity: ToastGravity.CENTER );
      error.toString();
    }

  }



}
