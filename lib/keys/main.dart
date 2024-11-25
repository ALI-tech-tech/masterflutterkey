import 'dart:math';
import 'package:flutter/material.dart';
import 'package:masterkey/keys/GlobalKeys_Eaxmples/my_form.dart';
import 'package:masterkey/keys/LocalKeys_Eamples/my_local_key.dart';
import 'package:masterkey/keys/GlobalKeys_Eaxmples/pagestorage_key.dart';
import 'package:masterkey/keys/GlobalKeys_Eaxmples/un_recommanded_way.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);
   final globalBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: 
      // const  MyFormPage()//  Call this for the form page to use Global Key

      // const MyScrollingList() // call this to show Perserve Scroll Position with PageStorageKey

      MyLocalKeyClass() // Call this for LocalKey Examples
      // HomePage()// the benefit of using KEYS in Flutter App
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myContainers = [
     GetContainer(color: Colors.yellow),
    GetContainer(color: Colors.green),
    // GetContainer(color: Colors.yellow,name:  "Ali",),
    // GetContainer(color: Colors.green, name: "Mohamed",),
    // Padding( // Use key at the top level
    //   key: UniqueKey(),
    //   padding: const EdgeInsets.all(8.0),
    //   child: GetContainer(color: Colors.yellow,name:  "Ali",),
    // ),
    // Padding( // Use kay at the top level
    //   key: UniqueKey(),
    //   padding: const EdgeInsets.all(8.0),
    //   child: GetContainer(color: Colors.green, name: "Mohamed",),
    // ),
  ];

  swapContainers() {
    setState(() {
      myContainers.insert(1, myContainers.removeAt(0));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: myContainers,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: swapContainers,
                child:const Text("Swap"),
              )
            ],
          ),
        ));
  }
}
class GetContainer extends StatelessWidget {
  GetContainer({required this.color});
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:color ,
      width: 50,
      height: 50,
    );
  }
}

// class GetContainer extends StatefulWidget {

//   GetContainer({required this.color, required this.name});
//   Color color;
//  // Key key;
//   String name;
//   @override
//   _GetContainerState createState() => _GetContainerState();
// }
// class _GetContainerState extends State<GetContainer> {
//   late Color color;
//   late String name;
//   @override
//   void initState() {
//     super.initState();
//     color = widget.color;
//     name =widget.name;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 50,
//         height: 50,
//       color: Colors.primaries[Random().nextInt(Colors.primaries.length)] , // to Generate a Random color for the Container
//       child: Text(name, style: TextStyle(fontSize: 17, color: Colors.white),),
//     );
//   }
// }


