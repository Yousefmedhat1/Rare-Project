

import 'package:flutter/material.dart';
import 'package:rare_crew_project/screens/add_tasks.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> data = [

    'Task 1',
    'Task 2',
    'Task 3',
    'Task 4',
    'Task 5',
    'Task 6'

  ];
  String text = '';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        floatingActionButton: FloatingActionButton(onPressed: (){

                  showModalBottomSheet(

              context: context, builder: (context)=> SingleChildScrollView(child: Container(
                  color: Colors.black,
    
                      padding:EdgeInsets.only(
                        
                        bottom: MediaQuery.of(context).viewInsets.bottom,




                      ) ,

                   
    
    
                   child:AddTasks()
               )
                ),
            isScrollControlled: true,
        );


        },
        backgroundColor: Colors.black,
          child: Icon(Icons.add_task),
        ),
          backgroundColor: Colors.orangeAccent,


        body: ListView.builder(

            itemCount:  data.length,
            itemBuilder: (context , index)


        {


        return  Card(

          color: Colors.orangeAccent,
          child: Padding(


            padding: const EdgeInsets.all(10.0),

            child: ListTile(

              title : Text(data[index]),

              trailing: Container(


                width:75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(

                        child: IconButton(onPressed: (){
                          showDialog(context: context, builder: (context)=> SimpleDialog(
                            children: [
                              TextField(
                                onChanged:(value){

                                  setState(() {
                                    text = value ;

                                  });
                                } ,

                              ),

                              SizedBox(height: 30,),

                              ElevatedButton(

                                  onPressed: (){

                                setState(() {
                                  data[index] = text ;
                                });
                                Navigator.pop(context);

                              },


                                  child: Text('Edit',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))

                            ],
                          ));


                        }, icon: Icon(Icons.edit_calendar_outlined))),

                    Expanded(

                        child: IconButton(onPressed: (){

                          setState(() {
                            data.removeAt(index);
                          });
                        },

                            icon: Icon(Icons.delete_forever)))

                  ],
                ),

              ),


            ),
          ),
        );


        }

        )



      ),
    );
  }
}
