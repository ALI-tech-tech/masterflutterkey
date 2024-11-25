import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Example"),
      ),
      body: Form(
        key: myKey,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                validator: (val)
                {
                  if(val!.length >=3)
                    {
                      return null;
                    }
                  else{
                    return 'Enter valid value';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Phone'),
                validator: (val){
                  if(val!.isNotEmpty)
                    {
                      return null;
                    }
                  else{
                    return 'Enter number please';
                  }
                },
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
               if(myKey.currentState!.validate())
                 {
                   myKey.currentState!.save();
                  // myKey.currentState.reset();
                   //myKey.currentState.activate()
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return NextPage();
                   }));
                 }
               else{
                 return;
               }
              }, child: Text("Log In"))
            ],
          ),
        ),
      ),
    );
  }
}
class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page"),),
      body: Center(child: Text("We are in Page 2"),),
    );
  }
}
