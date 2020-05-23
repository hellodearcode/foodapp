import 'package:flutter/material.dart';
import 'package:foodified/models/food.dart';
import 'package:foodified/models/restaurant.dart';
import 'package:foodified/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {

  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30.0,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite,color: Theme.of(context).primaryColor,size: 32.0,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "0.3 miles away",
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Rating_stars(widget.restaurant.rating),
                SizedBox(height: 5,),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Reviews",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10.0,),
          Center(
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index){
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(food.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [
                  0.1,0.4,0.6,0.9
                ]
              )
            ),
          ),
          Positioned(
            bottom: 60,
            child: Column(
              children: <Widget>[
                Text(
                  food.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.add,size: 30.0,color: Colors.white,),
                onPressed: (){},
              ),
            ),
          )
        ],
      ),
    );
  }
}

