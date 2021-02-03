import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  String intro='';
  String number='';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff075E54),
        title: Text('Whats App number'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.3),
              child: Container(
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.2,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "+972",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff075E54),width: 3),
                            ) ,
                        ),
                        onChanged: (value){
                          intro=value;
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*.7,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "0598045064",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff075E54),width: 3),
                            ),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.blueAccent),
                          // ) ,
                        ),
                        onChanged: (value){
                          number=value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
              child: FlatButton(
                onPressed: () async{
                  try{
                    var whatsappUrl = "whatsapp://send?phone=$intro - $number";
                    await canLaunch(whatsappUrl)
                        ? launch(whatsappUrl)
                        : print(
                        "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                  }catch(e){
                    print('some thing error');
                  }
                },
                child: Text('Go to whats app',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.32),
              child: Text('@abd_alftah_al_shanti',style: TextStyle(fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
