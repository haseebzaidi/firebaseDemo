import 'package:explore/Screens/ExploreFriendsSearch.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';
import 'package:firebase_database/firebase_database.dart';

class ExploreFriendsScreen extends StatefulWidget {
  @override
  _ExploreFriendsScreenState createState() => _ExploreFriendsScreenState();
}

class _ExploreFriendsScreenState extends State<ExploreFriendsScreen> {
  List<String> locations = [
    'Kuwait City',
    'Ahmadi',
    'Hawally',
    'Farwaniya',
    'Mubarak AlKabeer',
    'Jahra'
  ]; // Option 2
  String selectedLocation; // Option 2
  // String search;
  // bool loader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Color(0xfff3c8c87),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile('')),
                                );
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
                          'Explore Friends',
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
                      'assets/images/group.png',
                      scale: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      // onChanged: (value) {
                      //   searchMethod(value);
                      // },
                      decoration: new InputDecoration(
                        hintText: 'Search Username',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        // labelText: "Enter Name",
                        // helperText: 'Search Username',
                        // fillColor: Colors.grey,
                        // border: new OutlineInputBorder(
                        //   borderRadius: new BorderRadius.circular(25.0),
                        //   borderSide: new BorderSide(),
                        // ),
                        //fillColor: Colors.green
                      ),
                    ),
                    // child:
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xfff3c8c87)),
                    child: FlatButton(
                      onPressed: () {
                        // loader?
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ExploreFriendsSearch()),
                              );
                        // print("hhhhh");

                      },
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down),
                      hint: Text('Select'),
                      // Not necessary for Option 1
                      value: selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          selectedLocation = newValue;
                        });
                      },
                      items: locations.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xfff3c8c87), width: 2)),
                          child: ClipOval(
                            child: Material(
                              color: Colors.black,

                              // button color
                              // splashColor: Colors.red, // inkwell color
                              child: Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  'assets/images/gg.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Container(
                        //   width: 70,
                        //   height: 70,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.green,
                        //   ),
                        // ),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: Color(0xfff3c8c87),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(Icons.add, color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Ahmed Yousaf',
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '40,000 steps',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/medal.png',
                      scale: 1.5,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xfff3c8c87), width: 2)),
                          child: ClipOval(
                            child: Material(
                              color: Colors.black,

                              // button color
                              // splashColor: Colors.red, // inkwell color
                              child: Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  'assets/images/gg.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Container(
                        //   width: 70,
                        //   height: 70,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.green,
                        //   ),
                        // ),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: Color(0xfff3c8c87),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(Icons.add, color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Ahmed Yousaf',
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '40,000 steps',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/medal.png',
                      scale: 1.5,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xfff3c8c87), width: 2)),
                          child: ClipOval(
                            child: Material(
                              color: Colors.black,

                              // button color
                              // splashColor: Colors.red, // inkwell color
                              child: Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  'assets/images/gg.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Container(
                        //   width: 70,
                        //   height: 70,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.green,
                        //   ),
                        // ),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: Color(0xfff3c8c87),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(Icons.add, color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Ahmed Yousaf',
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '40,000 steps',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/medal.png',
                      scale: 1.5,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
            ),
          ],
        ),
      )),
    );
  }

  // bool searchMethod(String text) {
  //   DatabaseReference db = FirebaseDatabase.instance.reference().child("Data");
  //   db.orderByChild("name").equalTo(text).once().then((DataSnapshot snapshot) async {
  //   //  Map<dynamic, dynamic> values = snapshot.value;
  //
  //     if( await snapshot.value != null )
  //     {
  //       print("success");
  //       loader = true;
  //
  //     }
  //     else
  //     {
  //       print("unsuccess");
  //       loader =  false;
  //
  //     }
  //     // print(values["name"].toString());
  //    //  if (values["name"] != null) {
  //    //    return true;
  //    //  } else {
  //    //    return false;
  //    //  }
  //
  //     values.forEach((key,values) {
  //       print(values["name"]);
  //       if(values["name"] != null)
  //         {
  //           return true;
  //         }
  //       else
  //         {
  //           return false;
  //         }
  //     });
  //   });
  // }
}
