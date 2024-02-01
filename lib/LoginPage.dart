// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_7_flutter3/HomePage.dart';
import 'package:session_7_flutter3/PlayersModel.dart';

class LoginPage extends StatelessWidget {
  String player1 = "";
  static const routeName = "loginpage";
  TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0276),
        title: Center(child: Text("TIC TAC TOE",
        style: TextStyle(color: Colors.white,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold ),)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                onChanged: (value) {
                  player1 = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                    prefixIcon: Icon(Icons.person,color: Colors.black,),
                    label: Text("Player one name...",style: TextStyle(
                      color: Color(0xFFFF0276),fontSize: 14
                    ),),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              TextField(
                controller: player2,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                    prefixIcon: Icon(Icons.person , color: Colors.black,),
                    label: Text("Player two name...",style: TextStyle(
                      color: Color(0xFFFF0276),fontSize: 14
                    ),),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    HomePage.routeName , arguments: PlayerMode(player1, player2.text));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xFFFF0276),),
                child: Text(
                  "Let's Go",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}