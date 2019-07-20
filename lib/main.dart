import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('title'),
          titlePadding: EdgeInsets.all(20.0),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Please input something'
            ),
          ),
          contentPadding: EdgeInsets.all(20.0),
          actions: <Widget>[
            MaterialButton(onPressed: () {
              Navigator.of(context).pop(_controller.text.toString());
            }, child: Text('确定'),),
            MaterialButton(onPressed: () {}, child: Text('取消'),),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            String text = await createAlertDialog(context);
            print(text);
          },
          child: Text('Alert', style: TextStyle(fontSize: 20.0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.deepOrange,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
