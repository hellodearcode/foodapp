import 'package:flutter/material.dart';

class Rating_stars extends StatelessWidget {

  final int rating_stars;

  Rating_stars(this.rating_stars);

  @override
  Widget build(BuildContext context) {
    List<Widget> _rating = [];
    for(int i=0; i< rating_stars;i++){
      _rating.add(
        Icon(
          Icons.star,
          color: Colors.amberAccent,
        )
      );
    }
    return Row(
      children: _rating,
    );
  }
}
