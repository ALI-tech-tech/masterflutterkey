import 'package:flutter/material.dart';

class UnRecommandedWAY extends StatefulWidget {
  @override
  State<UnRecommandedWAY> createState() => _UnRecommandedWAYState();
}

class _UnRecommandedWAYState extends State<UnRecommandedWAY> {
  late GlobalKey<_CounterState> _counterState;

  @override
  void initState() {
    super.initState();
    _counterState = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
            children: <Widget>[
              Counter(
                key: _counterState,
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return Page1(_counterState);
            }),
          );
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    required Key key,
  }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
        Text(count.toString()),
      ],
    );
  }
}
class Page1 extends StatefulWidget {
  final GlobalKey<_CounterState> counterKey;
  Page1( this.counterKey);
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.counterKey.currentState?.count++;
                  print(widget.counterKey.currentState!.count);
                });
              },
            ),
            Text(
              widget.counterKey.currentState!.count.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}