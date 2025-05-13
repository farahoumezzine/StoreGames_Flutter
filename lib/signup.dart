

import 'package:flutter/material.dart';
import 'package:testapp/customInputdecoration.dart';
class Signup extends StatelessWidget{

 late String username, email, password, birthdate, address;
  GlobalKey<FormState> currentKey = GlobalKey();
  Signup({super.key});

@override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          "Sign Up Gstore ESPRIM",
          style: TextStyle(color: Colors.white),
          ),
    ),
body: Padding(padding: const EdgeInsets.all(10.0),
 child: Form(
    key: currentKey,
    child:ListView(
        children: [
           Image.asset("lib/assets/fortnite.jpg", width: 250),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "username",
                        "username",
                        Icon(Icons.person_2),
                      ).customDecoration(),
                  onSaved: (newValue) => username = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username should not be empty";
                    }
                  },
                ),
              ),

               Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "email",
                        "email",
                        Icon(Icons.email),
                      ).customDecoration(),
                  onSaved: (newValue) => email = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email should not be empty";
                    }
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                    obscureText: true,
                  decoration:
                      Custominputdecoration(
                        "password",
                        "password",
                        Icon(Icons.password),
                      ).customDecoration(),
                  onSaved: (newValue) => password = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password should not be empty";
                    }else if (value!.length < 8) {
                      return "password should have min 8 caracters";
                    }
                  },
                ),
              ),

                 Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "address",
                        "address",
                        Icon(Icons.house),
                      ).customDecoration(),
                  onSaved: (newValue) => address = newValue!,
                ),
              ),
              //birthdate
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration:
                      Custominputdecoration(
                        "birthdate",
                        "birthdate",
                        Icon(Icons.cake),
                      ).customDecoration(),
                  onSaved: (newValue) => birthdate = newValue!,
                ),
              ),


               Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentKey.currentState!.validate()) {
                        currentKey.currentState!.save();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return (AlertDialog(
                              title: Text("Sign up"),
                              content: Text("user Added"),
                            ));
                          },
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),
              ),


        ],
    ),
  ),

),
 
   );
  }}