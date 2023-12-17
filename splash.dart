import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(h1());

class h1 extends StatelessWidget {
  const h1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: h2(),
    );
  }
}

class h2 extends StatefulWidget {
  const h2({super.key});

  @override
  State<h2> createState() => _h2State();
}

class _h2State extends State<h2> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => h3())),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.login,
            size: 30,
            color: Colors.white,
          ),
          Text(
            'Welcome',
            style: TextStyle(decoration: TextDecoration.none),
          )
        ],
      ),
    );
  }
}

class h3 extends StatefulWidget {
  const h3({super.key});

  @override
  State<h3> createState() => _h3State();
}

class _h3State extends State<h3> {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 660,
            width: 400,
            color: Colors.greenAccent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Container(
                  height: 470,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 5),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      Container(height: 150),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          controller: myController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'enter the phone number',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.yellowAccent,
                                width: 4,
                              ))),
                        ),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        h4(myController.text)));
                          },
                          child: Text('done'))
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class h4 extends StatefulWidget {
  final String mydata;
  h4(this.mydata);

  @override
  State<h4> createState() => _h4State(this.mydata);
}

class _h4State extends State<h4> {
  String mydata;
  _h4State(this.mydata);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'otp send succesfully phone number in',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Container(
              height: 2,
              color: Colors.white,
            ),
            Text(mydata.toString()),
          ],
        ),
      ),
    );
  }
}
