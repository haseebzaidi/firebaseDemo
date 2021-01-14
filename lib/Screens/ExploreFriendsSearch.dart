import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ExploreFriendsSearch extends StatefulWidget {
  @override
  _ExploreFriendsSearchState createState() => _ExploreFriendsSearchState();
}

class _ExploreFriendsSearchState extends State<ExploreFriendsSearch> {
  bool loader = false;
  String mssage = 'No data Found';
  String search='';

  void searchMethod(String text) {
    DatabaseReference db = FirebaseDatabase.instance.reference().child("Data");
    db
        .orderByChild("name")
        .equalTo(text)
        .once()
        .then((DataSnapshot snapshot) async {
      //  Map<dynamic, dynamic> values = snapshot.value;

      if (await snapshot.value != null) {
        print("success");
        setState(() {
          loader = true;
        });
      } else {
        print("unsuccess");
        setState(() {
          loader = false;
        });
      }
      // print(values["name"].toString());
      //  if (values["name"] != null) {
      //    return true;
      //  } else {
      //    return false;
      //  }

      // values.forEach((key,values) {
      //   print(values["name"]);
      //   if(values["name"] != null)
      //     {
      //       return true;
      //     }
      //   else
      //     {
      //       return false;
      //     }
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              Icon(
                                Icons.home,
                                size: 30,
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
                        onChanged: (value) {
                         search = value;
                        },
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

                          searchMethod(search);
// setState(() {
//   loader = !loader;
// });
                          // print('haseeb')
                          //     : print("no data");
                          // Text("No data found",
                          //         style: TextStyle(color: Colors.red));
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
              Divider(
                thickness: 3,
              ),
              loader
                  ? Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xfff3c8c87),
                                        width: 2)),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.black,

                                    // button color
                                    // splashColor: Colors.red, // inkwell color
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset(
                                        'assets/images/gg.jpeg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(search),
                                  Text('Salam'),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              color: Color(0xfff3c8c87),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Colors.white),
                                  ),
                                  Icon(Icons.add,
                                      color: Colors.white)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ):Container(child: Text(mssage),)

            ],
          ),
        ),
      ),
    );
  }
}
