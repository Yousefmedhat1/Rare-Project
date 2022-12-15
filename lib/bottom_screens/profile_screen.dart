
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_crew_project/screens/login_screen.dart';

class Profile extends StatefulWidget {

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {






  @override

  Widget build(BuildContext context)


  {


    return  Scaffold(
      backgroundColor: Colors.black,


      body:Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [


                RichText(text: TextSpan(text: 'Welcome back, ',style: GoogleFonts.lato(color: Colors.orangeAccent,fontWeight: FontWeight.w900,fontSize: 15),

                    children: <TextSpan>[

                      TextSpan(text: 'Yousef Medhat',style: GoogleFonts.lato(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.w900) ),
                    ]


                ),



                ),
                SizedBox(height: 5,),
                Text('Email@email.com',style: GoogleFonts.lato(fontSize:15,color: Colors.grey,fontWeight: FontWeight.w900),),
                const   SizedBox(height: 20,),

                const    Divider(
                  thickness: 2,
                  color: Colors.orangeAccent,

                ),
                const   SizedBox(height: 20,),


                IconButton( onPressed: ()async {

                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

                }, icon: const Icon(Icons.logout_outlined,color: Colors.red,size: 35,),),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
