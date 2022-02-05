// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coolmovies/controllers/review-detail.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewDetailPage extends GetView<ReviewDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetX<ReviewDetailController>(builder: (controller) {
            if (controller.movie.value == null) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              );
            }

            return CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: controller.movie.value!.imgUrl!,
            );
          }),
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
                    0.8,
                  ],
                  colors: [
                    Color(0xFF121212).withOpacity(.6),
                    Color(0xFF121212)
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      getLogo(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        margin: EdgeInsets.only(top: 40),
                        child:
                            GetX<ReviewDetailController>(builder: (controller) {
                          if (controller.movie.value == null) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 160),
                              getMovieText(),
                              getTitleText(controller),
                              SizedBox(height: 40),
                              getDirectorText(controller),
                              SizedBox(height: 8),
                              getReleaseDateText(controller),
                              SizedBox(height: 40),
                              getReviewCircle(controller),
                              SizedBox(height: 40),
                              getReviewList(controller),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
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
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        'The movie',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  getTitleText(ReviewDetailController controller) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        controller.movie.value!.title!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  getDirectorText(ReviewDetailController controller) {
    return RichText(
      text: TextSpan(
        text: "Director: ",
        style: TextStyle(color: Color(0xFFE50914), fontSize: 16),
        children: <TextSpan>[
          TextSpan(
              text: controller.movie.value!.director!.name!,
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  getReleaseDateText(ReviewDetailController controller) {
    return RichText(
      text: TextSpan(
        text: "Release date: ",
        style: TextStyle(color: Color(0xFFE50914), fontSize: 16),
        children: <TextSpan>[
          TextSpan(
              text: controller.movie.value!.releaseDate!,
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  getReviewCircle(ReviewDetailController controller) {
    return Center(
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFE50914),
            width: 4,
          ),
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "4.5/5",
              style: TextStyle(
                  color: Color(0xFFE50914),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "stars",
              style: TextStyle(color: Color(0xFFE50914), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  getReviewList(ReviewDetailController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            width: 178,
            height: 44,
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE50914),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              label: Text('New Review'),
              onPressed: () {},
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gabriel Sereno',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Color(0xFFE50914),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.star, color: Color(0xFFE50914), size: 14),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Something that you want to tell about the movie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 8,
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
