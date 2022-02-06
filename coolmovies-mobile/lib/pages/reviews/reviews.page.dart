// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coolmovies/controllers/reviews.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsPage extends GetView<ReviewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0,
                    0.95,
                  ],
                  colors: [
                    Color(0xFF121212).withOpacity(.4),
                    Color(0xFF121212)
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    getLogo(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          getMovieText(),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 340,
                            child:
                                GetX<ReviewsController>(builder: (controller) {
                              return Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.moviesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/reviews/detail',
                                          arguments: [
                                            controller.moviesList[index].id
                                          ]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Container(
                                          child: Center(
                                            child: Stack(
                                              children: [
                                                getImage(controller, index),
                                                getImageFilter(),
                                                getTitle(controller, index),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getLogo() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Image(
        image: AssetImage('assets/images/logo.png'),
        width: 56,
        height: 56,
      ),
    );
  }

  getMovieText() {
    return Container(
      child: Text(
        'New Movies',
        style: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }

  getImage(ReviewsController controller, int index) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        width: 260,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl: controller.moviesList[index].imgUrl!,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  getImageFilter() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: 260,
        height: 340,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0,
              1,
            ],
            colors: [
              Colors.black.withOpacity(.2),
              Colors.black,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  getTitle(ReviewsController controller, int index) {
    return Positioned(
      bottom: 16,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Text(
                controller.moviesList[index].title!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    controller
                        .averageRating(controller.moviesList[index].reviews!)
                        .toDouble()
                        .toStringAsFixed(0),
                    style: TextStyle(
                        color: Color(0xFFE50914),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xFFE50914),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
