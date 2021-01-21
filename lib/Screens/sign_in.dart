import 'package:explore/Screens/password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ExploreFirendsScreen.dart';
import 'Profile.dart';
import 'Sign_Up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Sign_In extends StatefulWidget {
  @override
  _Sign_InState createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  String email;
  String pass;
  String name;
  String dbpassword;
  bool passGood = true;
  bool loader = false;

  void verify(String email, String password) {
    DatabaseReference db = FirebaseDatabase.instance.reference().child("User");
    db
        .orderByChild("email")
        .equalTo(email)
        .once()
        .then((DataSnapshot snapshot) async {
      //  Map<dynamic, dynamic> values = snapshot.value;

      if (await snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          name = values["name"];
          dbpassword =values["password"];
          print(name);
          print(dbpassword);
        });
       if(dbpassword == password) {
          print("success");

          setState(() {
            loader = true;

          });
        }
       else {
         print("unsuccessP");
         setState(() {
           loader = false;
         });
       }
      }
      else {
        print("unsuccessE");
        setState(() {
          loader = false;
        });
      }
    });
  }

  // FirebaseAuth loggedInUser = FirebaseAuth.instance;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getCurrentUser();
  // }
  // void getCurrentUser() async
  // {
  //  final user = await _auth.currentUser;
  // try
  // {
  //     if (user != null) {
  //       loggedInUser = user as FirebaseAuth;
  //       print(user.email);
  //     }
  //   }
  //   catch (e)
  //   {
  //     print(e);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "      ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    //   width: MediaQuery.of(context).size.width * 0.25,
                    //   margin: EdgeInsets.only(top: 30, left: 130),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff3c8c87),
                      border: Border.all(
                          color: Color(0xfff3c8c87), // set border color
                          width: 2.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(30.0)), // set rounded corner radius
                    ),
                    child: FlatButton(
                      // color: Color(0XFF507d60),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sign_Up()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 35, top: 40),
              child: Container(
                color: Color(0XFFf0f2f1),
                child: TextField(
                    onChanged: (value) {
                      email = value;
                      verify(email, pass);
                    },
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: new BorderSide(color: Colors.grey)),
                      hintText: "Email",
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
                    onChanged: (value) {
                      pass = value;
                      verify(email, pass);
                    },
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
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Password()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 200),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff3c8c87)),
                ),
              ),
            ),
            passGood
                ? Container()
                : Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      'Wrong Credientals',
                      style: TextStyle(color: Colors.red),
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
                  loader
                      ? setState(() {
                          passGood = true;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile(name)));
                        })
                      : setState(() {
                          passGood = false;
                        });

                  // try {
                  //   final user = await _auth.signInWithEmailAndPassword(
                  //       email: email, password: pass);
                  //   if (user != null) {
                  //     setState(() {
                  //       passGood = true;
                  //     });
                  //
                  //   }
                  // } catch (e) {
                  //   setState(() {
                  //     passGood = false;
                  //   });
                  // }
                },
                child: Text(
                  "Log In",
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
