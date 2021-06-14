import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'G CALC'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget outlinebuttoncustom(String val) {
    //FUNCTION 1
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.amber,
          backgroundColor: Colors.black87,
          padding: EdgeInsets.all(23),
        ),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  late int first, second;
  late String res, text = "";
  //FUNCTION 2
  late String opp, history = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = text = "";
      first = 0;
      second = 0;
      history = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
        history = first.toString() + opp.toString() + second.toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
        history = first.toString() + opp.toString() + second.toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
        history = first.toString() + opp.toString() + second.toString();
      }
      if (opp == "/") {
        res = (first / second).toString();
        history = first.toString() + opp.toString() + second.toString();
      }
    } else {
      res = text + btnText;
    }
    setState(() {
      text = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        //padding: EdgeInsets.symmetric(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 12),
                alignment: Alignment.bottomRight,
                child: Text(
                  history,
                  style: TextStyle(fontSize: 35, color: Colors.black54),
                ),
              ),
            ),
            //Expanded(
            //child:
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 45),
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
            Row(
              children: <Widget>[
                outlinebuttoncustom("1"),
                outlinebuttoncustom("2"),
                outlinebuttoncustom("3"),
                outlinebuttoncustom("+"),
              ],
            ),
            Row(
              children: <Widget>[
                outlinebuttoncustom("4"),
                outlinebuttoncustom("5"),
                outlinebuttoncustom("6"),
                outlinebuttoncustom("-"),
              ],
            ),
            Row(
              children: <Widget>[
                outlinebuttoncustom("7"),
                outlinebuttoncustom("8"),
                outlinebuttoncustom("9"),
                outlinebuttoncustom("x"),
              ],
            ),
            Row(
              children: <Widget>[
                outlinebuttoncustom("C"),
                outlinebuttoncustom("0"),
                outlinebuttoncustom("="),
                outlinebuttoncustom("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
