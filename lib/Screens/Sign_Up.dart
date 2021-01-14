import 'package:explore/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Sign_Up extends StatefulWidget {
  @override
  _Sign_UpState createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 40),
                  child: Container(
                    color: Color(0XFFf0f2f1),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                        decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: new BorderSide(color: Colors.grey)),
                      hintText: "First Name",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w800),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 35, top: 40),
                  child: Container(
                    color: Color(0XFFf0f2f1),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                        decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: new BorderSide(color: Colors.grey)),
                      hintText: "Last Name",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w800),
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 35, top: 20),
              child: Container(
                color: Color(0XFFf0f2f1),
                child: TextField(
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: "Email",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                ),
                  onChanged: (value){
                      email = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 35, top: 20),
              child: Container(
                color: Color(0XFFf0f2f1),
                child: TextField(
                 // obscureText: true,
                    decoration: new InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text('show',
                        style: TextStyle(
                          color: Color(0xfff3c8c87),
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: "Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                ),
                  onChanged: (value){
                    password = value;
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.only(top: 80, right: 5),
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
                onPressed: () async {
                  try{
                    final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newuser != null)
                      {
                        print(email);
                        print(password);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sign_In()),
                        );
                      }
                  }
                  catch (e)
                  {
                    print(e);
                  }

                },
                child: Text(
                  "Sign Up",
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
