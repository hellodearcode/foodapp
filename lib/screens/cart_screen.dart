import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodified/data/data.dart';
import 'package:foodified/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  _buildCartItem(Order order){
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 160.0,
      child: Row(
        children: <Widget>[
          Container(
            width: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(order.food.imageUrl),
                fit: BoxFit.cover
              )
            ),
            child: Center(),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    order.food.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    order.restaurant.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.8,color: Colors.black54)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){},
                          child: Text("-",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0),)
                        ),
                        SizedBox(width: 20.0,),
                        Text(order.quantity.toString()),
                        SizedBox(width: 20.0,),
                        GestureDetector(
                            onTap: (){},
                            child: Text("+",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0),)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              "\$${order.quantity * order.food.price}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    currentUser.cart.forEach((Order order)=> totalPrice += order.quantity * order.food.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})'
        ),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          if(index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Estimated Delivery Time",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0),),
                    Text("25 Min",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0),)
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total Cost",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0),),
                    Text("\$ ${totalPrice.toStringAsFixed(2)}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 20.0),)
                  ],
                ),
                SizedBox(height: 70.0,),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: currentUser.cart.length + 1
      ),
      bottomSheet: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,-1),
              blurRadius: 6.0
            )
          ]
        ),
        child: FlatButton(
          onPressed: (){},
          child: Text(
            "CHECKOUT",
            style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold,letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }
}
