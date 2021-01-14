import 'package:flutter/material.dart';

import 'explore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Color(0xfff3c8c87),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Setting',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Logout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        'Sarah',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    // borderRadius: BorderRadius.circular(radius)
                    // color: Colors.green[300],
                  ),
                  child: Image.asset(
                    'assets/images/women.png',
                    // scale: ,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "12,200 Steps",
            style: TextStyle(
                color: Color(0xfff3c8c87),
                fontSize: 25,
                fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        height: 70,
                        child: Image.asset("assets/images/group.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff3c8c87),
                            border: Border.all(
                                color: Color(0xfff3c8c87), // set border color
                                width: 1.0), // set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                30.0)), // set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0XFF507d60),
                                  offset: Offset(1, 3))
                            ] // make rounded corner of border
                            ),
                        child: FlatButton(
                          // color: Color(0XFF507d60),

                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>Sign_Up()),
                            // );
                          },
                          child: Text(
                            "Friends",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 100,
                        height: 70,
                        child: Image.asset("assets/images/magnifier.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff3c8c87),
                            border: Border.all(
                                color: Color(0xfff3c8c87), // set border color
                                width: 1.0), // set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                30.0)), // set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xfff3c8c87),
                                  offset: Offset(1, 3))
                            ] // make rounded corner of border
                            ),
                        child: FlatButton(
                          // color: Color(0XFF507d60),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Explore()),
                            );
                          },
                          child: Text(
                            "Explore",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        height: 70,
                        child: Image.asset("assets/images/badge.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff3c8c87),
                            border: Border.all(
                                color: Color(0xfff3c8c87), // set border color
                                width: 1.0), // set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                30.0)), // set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0XFF507d60),
                                  offset: Offset(1, 3))
                            ] // make rounded corner of border
                            ),
                        child: FlatButton(
                          // color: Color(0XFF507d60),

                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>Sign_Up()),
                            // );
                          },
                          child: Text(
                            "Create Challenge",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff3c8c87),
                            border: Border.all(
                                color: Color(0xfff3c8c87), // set border color
                                width: 1.0), // set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                30.0)), // set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0XFF507d60),
                                  offset: Offset(1, 3))
                            ] // make rounded corner of border
                            ),
                        child: FlatButton(
                          // color: Color(0XFF507d60),

                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>Sign_Up()),
                            // );
                          },
                          child: Text(
                            "Check Progress",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                        width: 100,
                        height: 70,
                        child: Image.asset("assets/images/footsteps.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff3c8c87),
                            border: Border.all(
                                color: Color(0xfff3c8c87), // set border color
                                width: 1.0), // set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                30.0)), // set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xfff3c8c87),
                                  offset: Offset(1, 3))
                            ] // make rounded corner of border
                            ),
                        child: FlatButton(
                          // color: Color(0XFF507d60),

                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>Sign_Up()),
                            // );
                          },
                          child: Text(
                            "Steps Wall",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
