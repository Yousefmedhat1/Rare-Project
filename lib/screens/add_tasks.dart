


import 'package:flutter/material.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? newTaskTitle;
    return  Container(
      padding: EdgeInsets.all(30),
      
      child: Column(
        children: [
          const Text('Add A New Task',style: TextStyle(


            fontSize: 30,
            color: Colors.orangeAccent ,
            fontWeight: FontWeight.bold

          ),
            textAlign: TextAlign.center,

          ),

           TextField(

            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText ;
            },

          ),
          SizedBox(height: 40),

          TextButton(onPressed: (){


          }, child:const Text('Add'),style: TextButton.styleFrom(

          foregroundColor: Colors.black, backgroundColor: Colors.orangeAccent

          ),

          ),
        ],
      ),



    );
  }
}
