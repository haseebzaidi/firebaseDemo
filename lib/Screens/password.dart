import 'package:explore/Screens/sign_in.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.24,
                  margin: EdgeInsets.only(top: 25, left: 25),
                  decoration: BoxDecoration(
                      color: Color(0xfff3c8c87),
                      border: Border.all(
                          color: Color(0xfff3c8c87), // set border color
                          width: 5.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(30.0)), // set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            color: Color(0XFF507d60), offset: Offset(1, 3))
                      ] // make rounded corner of border
                      ),
                  child: FlatButton(
                    // color: Color(0XFF507d60),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sign_In()),
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 35, top: 40),
              child: Container(
                color: Color(0XFFf0f2f1),
                child: TextField(
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: "New Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 35, top: 40),
              child: Container(
                color: Color(0XFFf0f2f1),
                child: TextField(
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.only(top: 100, right: 5),
              decoration: BoxDecoration(
                  color: Color(0xfff3c8c87),
                  border: Border.all(
                      color: Color(0xfff3c8c87), // set border color
                      width: 10.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)), // set rounded corner radius
                  boxShadow: [
                    BoxShadow(color: Color(0XFF507d60), offset: Offset(1, 3))
                  ] // make rounded corner of border
                  ),
              child: FlatButton(
                // color: Color(0XFF507d60),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sign_In()),
                  );
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
