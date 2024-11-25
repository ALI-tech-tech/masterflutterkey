//import 'package:flutter/foundation.dart';
import 'dart:math';

import 'package:flutter/material.dart';
class MyScrollingList extends StatefulWidget {
  const MyScrollingList({Key? key}) : super(key: key);

  @override
  State<MyScrollingList> createState() => _MyScrollingListState();
}

class _MyScrollingListState extends State<MyScrollingList> {
  List<Widget> myWidget = [PageONE(), PageTwo()];
  int currentPage =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: myWidget[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Page2")
        ],
        onTap: (val)=>setState(() {
          currentPage= val;
        },
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return PageThree();
          }));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class PageONE extends StatefulWidget {
  const PageONE({Key? key}) : super(key: key);

  @override
  State<PageONE> createState() => _PageONEState();
}

class _PageONEState extends State<PageONE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1"),),
      body:
      // ListView.separated( // ListView Example
      //   key: PageStorageKey<String>("list"),
      //     itemCount: 100,
      //     itemBuilder: (context, index)
      // {
      //   return ListTile(
      //     title: Text("item $index", style: TextStyle(fontSize: 22),),
      //   );
      //
      // },
      //     separatorBuilder: (context, index){return Divider(
      //       thickness: 2,
      //
      //     );}
      // ),

      GridView.builder(  // GridView Eaxmple
            key:PageStorageKey<String>("grid"),
            itemCount: 200,
            itemBuilder: (context, index){
              return Card(
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade300, //Colors.purple.shade200,
                child: Padding(padding: EdgeInsets.all(10),
                  child: Text("Item $index",style: TextStyle(fontSize: 25),),),
              );
            },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
      )
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'),),
      body: Center(child: Text("We are in Page 2"),),
    );
  }
}
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 3"),),
      body: Center(child: Text("Page 3", style: TextStyle(fontSize: 25),),),
    );
  }
}
