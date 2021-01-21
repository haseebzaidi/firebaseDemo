import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class testing extends StatefulWidget {
  String username;
  testing(this.username);
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  List<String> listallname = [];
  List<String> list = [];
  void getallnames() {
    // list=[];
    DatabaseReference db = FirebaseDatabase.instance.reference().child("User");
    db.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> values = await snapshot.value;
      values.forEach((key, values) => listallname.add(values["name"].toString()));
      if (listallname != null) {
        print(listallname);
        finallist();
      }
      setState(() {

      });
    });
  }
  void getfriendsData() {
    // list=[];
    DatabaseReference db = FirebaseDatabase.instance.reference().child(widget.username);
    db.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> values = await snapshot.value;
      values.forEach((key, values) => list.add(values["Fname"].toString()));
      if (list != null) {
        print(list);

      }
      setState(() {

      });
    });
  }
  void finallist()
  {
    for(int i = 0; i < listallname.length ; i++ )
    {
      print(listallname[i].toString());
      DatabaseReference db = FirebaseDatabase.instance.reference();
      db.child(listallname[i].toString()).orderByChild("Fname")
          .equalTo(widget.username)
          .once()
          .then((DataSnapshot snapshot) async {
        if (await snapshot.value != null)
        {
          db.child(widget.username)
              .push()
              .set({'Fname': listallname[i],});
          list.add(listallname[i].toString());
          print(list);
        }
        else {
          print("cant find");
        }
        setState(() {

        });
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
      body: Container(
        child:   ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
           itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
             return Text(list[index], style: TextStyle(fontSize: 30),);
            }),
      ),
    );
  }
}
