import 'package:flutter/material.dart';
class StudentInfo{
  int s_id;
  String s_name;
  double avg;
  StudentInfo({required this.s_id, required this.s_name, required this.avg});
}

class StudentPage extends StatelessWidget {
  StudentInfo student ;
  Key key;
  Color color;
  StudentPage({required this.student , required this.color , required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        title:  Text("${student.s_name}"),
        subtitle: Text("${student.s_id}   :  ${student.avg}"),
      ),
    );
  }
}
