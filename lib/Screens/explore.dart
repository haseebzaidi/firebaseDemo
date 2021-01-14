import 'package:explore/Screens/ExploreFirendsScreen.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
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
                              'Back',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.home,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        'Explore',
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
                    'assets/images/magnifier.png',
                    scale: 7,
                  ),
                ),
              ),
            ],
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExploreFriendsScreen()),
                            );
                          },
                          child: Text(
                            "Explore Friends",
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
                      Icons.location_on_outlined,
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
                            "Explore Places",
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
                            "Explore Challenge",
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
