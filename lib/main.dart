import 'package:bloc_example/color_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  ColorBloc cb = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BloC example'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: cb.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 100.0,
                height: 100.0,
                color: snapshot.data,
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                cb.eventSink.add(ColorEvent.AmberColor);
              },
            ),
            SizedBox(
              width: 10.0,
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                cb.eventSink.add(ColorEvent.GreenColor);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cb.dispose();
  }
}
