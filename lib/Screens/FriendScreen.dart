import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FriendScreen extends StatefulWidget {
  String username;

  FriendScreen(this.username);

  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  List<String> listallname = [];
  List<String> list = [];

  void getallnames() {
    // list=[];
    DatabaseReference db = FirebaseDatabase.instance.reference().child("User");
    db.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> values = await snapshot.value;
      values
          .forEach((key, values) => listallname.add(values["name"].toString()));
      if (listallname != null) {
        listallname.remove(widget.username);
        print(listallname);
        finallist();
      }
      setState(() {});
    });
  }
  void getfriendsData() {
    // list=[];
    DatabaseReference db =
        FirebaseDatabase.instance.reference().child(widget.username);
    db.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> values = await snapshot.value;
      values.forEach((key, values) => list.add(values["Fname"].toString()));
      if (list != null) {
        print(list);

      }
      setState(() {});
    });
  }

  void finallist() {
    for (int i = 0; i < listallname.length; i++) {
      print(listallname[i].toString());
      DatabaseReference db = FirebaseDatabase.instance.reference();
      db.child(listallname[i].toString())
          .orderByChild("Fname")
          .equalTo(widget.username)
          .once()
          .then((DataSnapshot snapshot) async {
        if (await snapshot.value != null) {
          //for(int j = 0; j < list.length ; j++ ){
           // if(list[j].toString() == listallname[i].toString())
              if(list.any((item) => listallname.contains(item)))
              {
                print("same");
              }
            else
              {
                db.child(widget.username).push().set({
                  'Fname': listallname[i],
                });
                list.add(listallname[i].toString());
                print(list);
              }
        //  }

        } else {
          print("cant find");
        }
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfriendsData();
    getallnames();
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
                      color: Colors.white,
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff3c8c87),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
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
                            'Friends',
                            style: TextStyle(
                                color: Color(0xfff3c8c87),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              color: Color(0xfff3c8c87),
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xfff3c8c87),
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '1',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xfff3c8c87),
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '3',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      28.0,
                      28.0,
                      28.0,
                      0.0,
                    ),
                    child: Text(
                      'All Friends',
                      style: TextStyle(
                          color: Color(0xfff3c8c87),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(list[index]),
                                  Text('Salam'),
                                ],
                              ),
                            ],
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     // shape: BoxShape.circle,
                          //     color: Color(0xfff3c8c87),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           'Add',
                          //           style: TextStyle(color: Colors.white),
                          //         ),
                          //         Icon(Icons.add, color: Colors.white)
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
