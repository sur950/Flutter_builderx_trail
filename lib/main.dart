import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool added = false;
  static String text = "My Button";
  TextEditingController controller = new TextEditingController(text: "");
  List<Widget> _children = [
    AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text("BuilderX Fun :) ", style: TextStyle(color: Colors.white)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Colors.white,
              margin: EdgeInsets.only(left: 300, top: 50),
              child: Container(
                height: 700,
                width: 400,
                child: ListView.builder(
                  itemCount: _children.length,
                  itemBuilder: ((context, index) {
                    return _children[index];
                  }),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.only(left: 400, top: 10),
              child: Container(
                height: 100,
                width: 300,
                child: Container(
                  height: 50,
                  width: 300,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    child: Text('Add/Remove Button'),
                    onPressed: () {
                      added
                          ? _children.removeLast()
                          : _children.add(
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  height: 50,
                                  width: 200,
                                  child: RaisedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: new Text("Button Name?"),
                                            content: new TextField(
                                              controller: controller,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Give Your Button Name",
                                              ),
                                            ),
                                            actions: <Widget>[
                                              RaisedButton(
                                                onPressed: () {
                                                  text = controller.value
                                                      .toString();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Ok",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                      setState(() {});
                                    },
                                    child: Text(text),
                                  ),
                                ),
                              ),
                            );
                      setState(() {
                        added = !added;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
