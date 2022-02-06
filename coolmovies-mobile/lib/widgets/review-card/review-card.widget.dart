import 'package:flutter/material.dart';

class ReviewCard extends StatefulWidget {
  final String name;
  final String rating;
  final String title;
  final String review;
  final Function onTap;

  ReviewCard(
      {required this.name,
      required this.rating,
      required this.title,
      required this.review,
      required this.onTap});

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
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
                      widget.rating,
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
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.review,
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
            child: GestureDetector(
              onTap: () => widget.onTap(),
              child: Icon(Icons.edit, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
