import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF21252d),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("title-credits".tr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFF282e39),
                  border: Border.all(color: Color(0xFF1b1f25)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text("text-credits".tr,
                    style: TextStyle(color: Colors.white, fontSize: 14))),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF282e39),
                border: Border.all(color: Color(0xFF1b1f25)),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Icons:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Icons made by Freepik from www.flaticon.com is lincensed by CC 3.0 BY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Websites:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Aleteia, Associação Redemptionis Sacramentum",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Inspiration:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Pawel Grela",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
