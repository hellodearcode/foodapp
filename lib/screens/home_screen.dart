import 'package:flutter/material.dart';
import 'package:foodified/data/data.dart';
import 'package:foodified/models/restaurant.dart';
import 'package:foodified/screens/cart_screen.dart';
import 'package:foodified/screens/restaurant_screen.dart';
import 'package:foodified/widgets/rating_stars.dart';
import 'package:foodified/widgets/recent_orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _buildRestaurants(){
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant _restaurant){
      restaurantList.add(
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: _restaurant),
              )
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey[200],
              ),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: _restaurant.imageUrl,
                    child: Image(
                      image: AssetImage(_restaurant.imageUrl),
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _restaurant.name,
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Rating_stars(_restaurant.rating),
                        Text(
                          _restaurant.address,
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "0.2 miles away",
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      );
    });
    return Column(
      children: restaurantList,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodified"),
        leading: IconButton(
          icon: Icon(Icons.account_circle,color: Colors.white,),
          onPressed: (){},
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(),
                  )
              );
            },
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8)
                ),
                hintText: "Search Food, Deal or Restaurants",
                prefixIcon: Icon(Icons.search,size: 30,),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: (){},
                )
              ),
            ),
          ),
          Recent_Orders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Nearby Restaurants",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildRestaurants()
            ],
          ),
        ],
      ),
    );
  }
}
