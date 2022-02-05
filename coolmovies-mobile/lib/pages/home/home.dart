// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 200,
                height: 200,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 260,
                      child: Text(
                        'HAVE YOU ALREADY CHOOSE YOUR DISTRICT?',
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        'You can decide here',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Get_Button(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Get_Button() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
        width: 260,
        height: 76,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFE50914),
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Text('WATCH MORE'),
          onPressed: () {
            Get.toNamed('/reviews');
          },
        ),
      ),
    );
  }
}
