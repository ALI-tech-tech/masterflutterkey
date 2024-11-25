import 'package:flutter/material.dart';
import 'package:masterkey/keys/LocalKeys_Eamples/student_info.dart';

class MyLocalKeyClass extends StatefulWidget {
  const MyLocalKeyClass({Key? key}) : super(key: key);

  @override
  State<MyLocalKeyClass> createState() => _MyLocalKeyClassState();
}

class _MyLocalKeyClassState extends State<MyLocalKeyClass> {
  List<Widget> myWidget= [
    Text("First", style: TextStyle(fontSize: 20),key: ValueKey(1),),
    Text("Second", style: TextStyle(fontSize: 20),key: ValueKey(2),),
    Text("Third", style: TextStyle(fontSize: 20),key: ValueKey(3),),

  ];
  List<StudentInfo> list= [
    StudentInfo(s_id: 1, s_name: "Ali", avg: 75.9),
    StudentInfo(s_id: 2, s_name: "Mohammed", avg: 95.4),
    StudentInfo(s_id: 3, s_name: "Safi", avg: 81.4)
  ] ;
  late List<StudentPage> studentPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentPage=[
      StudentPage(student: list[0], color: Colors.lime.shade300, key: ObjectKey(list[0])),
      StudentPage(student: list[1], color: Colors.pink.shade300, key: ObjectKey(list[1])),
      StudentPage(student: list[2], color: Colors.purple.shade200, key: ObjectKey(list[2])),
      StudentPage(student: list[0], color: Colors.lime.shade300, key: UniqueKey()),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Key Example"),),
      body: Column(
        // TODO Step #1
        // children:const  [
        //   Text("One", key: ValueKey(1),),
        //   Text("Two", key: ValueKey(2),),
        //   Text("Three", key: ValueKey(3),)
        // ],
        //TODO Step #2
        // children: myWidget.map((e)  {
        //   if( e.key== ValueKey(2))
        //        { return Container(child: e, color: Colors.purple[300], width: 150,height: 50,);}
        //       return  Container(child: e,margin: EdgeInsets.all(10), color: Colors.amber,width: 200,height: 100,);
        //     }).toList(),

         children: studentPage,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            studentPage.insert(0,studentPage.removeAt(2));

            //ToDO to delete a Text by its KeY
          //   myWidget.removeWhere((element)
          // {return element.key == ValueKey(2);});
          });
        },
        child: const Icon(Icons.swap_calls),
      ),
    );
  }
}
