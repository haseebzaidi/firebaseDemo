import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SingleItemDesign extends StatefulWidget {
  final String name;
  final String username;
  SingleItemDesign(this.name,this.username);
  @override
  _SingleItemDesignState createState() => _SingleItemDesignState();
}

class _SingleItemDesignState extends State<SingleItemDesign> {

  String Selected_name;
  bool btn  = false;
  List<String> list = [];

  void getDataforverify() {
    // list=[];
    DatabaseReference db = FirebaseDatabase.instance.reference().child(widget.username);
    db.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> values = await snapshot.value;
      values.forEach((key, values) => list.add(values["Fname"].toString()));
      if (list.contains(Selected_name)) {

        print("Same");

      }
      else{
        frndlist();
        setState(() {

        });
      }

    });
  }
  void frndlist() {
    DatabaseReference dbf = FirebaseDatabase.instance.reference();
    dbf
        .child(widget.username)
        .push()
        .set({'Fname': Selected_name,});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        child: InkWell(
                          onTap: () {
                            setState(() {
                             btn = true;
                            });
                            //change(btn);
                            Selected_name = widget.name;
                            getDataforverify();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => testing(widget.Username)),
                            // );

                          },
                          child: btn ? Icon(Icons.check , color: Colors.white): Row(
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
                                widget.name,
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
    );
  }
}
