import 'package:flutter/material.dart';
import 'package:reactive_counter/counter_bloc.dart';

void main() => runApp(MyApp());

/// MyApp is the root widget of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// MyHomePage is a widget that displays the app title in the app bar and
/// contains a counter that can be incremented.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: bloc.counter,
              builder: (context, snapshot) => Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment.add(null),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
