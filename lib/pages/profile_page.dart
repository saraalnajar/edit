import 'dart:async';

import 'package:flutter/material.dart';
import 'package:first_app/pages/edit_password.dart';
import 'package:first_app/pages/edit_email.dart';

import 'package:first_app/pages/edit_name.dart';
import 'package:first_app/pages/edit_phone.dart';
import '../user/user.dart';
import '../user/user_data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.brown,
           title:
          Center(
             
                  child: Text(
                    'Setting',
                 
                  ))),
       
          buildUserInfoDisplay(user.name, 'Name', EditNameFormPage()),
          buildUserInfoDisplay(user.phone, 'Phone', EditPhoneFormPage()),
          buildUserInfoDisplay(user.email, 'Email', EditEmailFormPage()),
          Expanded(
            child: buildpass(user),
            flex: 4,
          )
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: 
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Row(children: [Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ),Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                ]))
              ),),],
          )
          );

  Widget buildpass(User user) => Padding(
      padding: EdgeInsets.only(top: 16),
      child: 
          Column(
            children: [
              Container(
                  width: 350,
                     
                 child: Row(            crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                   
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(EditPassFormPage());
                            },
                            child:Row(children: [
                     Text("Password",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),

                              ),
                             Spacer(),  Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                             ], ),)
                    
         
      ),],),
                           
),
   Container( width:350,
   child: Divider(thickness: 1, height: 3, color: Colors.black38,))       ,
          
  Row(
                mainAxisAlignment: MainAxisAlignment.center

,
                children: [
                  Padding(
                    padding:     EdgeInsets.only(top: 40),

                    child: ElevatedButton(
                      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
  ), 
                      onPressed: () {                              Navigator.pop(context);
},
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black54)),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                        onPressed: () {                              Navigator.pop(context);
},
                      
                        child: Text("SAVE",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white))),
                  )
                ],
              )
  ],
          ),
          
      );
                     


  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
